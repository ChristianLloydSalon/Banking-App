import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/send_money.dart';

part '../event/send_money_event.dart';
part '../event/send_money_presentation_event.dart';
part '../state/send_money_state.dart';

class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState>
    with BlocPresentationMixin<SendMoneyState, SendMoneyPresentationEvent> {
  SendMoneyBloc({required SendMoney sendMoneyUsecase})
    : _sendMoneyUsecase = sendMoneyUsecase,
      super(SendMoneyState()) {
    on<SendMoneyRequested>(_onSendMoneyRequested);
  }

  final SendMoney _sendMoneyUsecase;

  Future<void> _onSendMoneyRequested(
    SendMoneyRequested event,
    Emitter<SendMoneyState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SendMoneyStatus.loading));
      await _sendMoneyUsecase.call(SendMoneyParams(amount: event.amount));
      emit(state.copyWith(status: SendMoneyStatus.success));
      emitPresentation(
        SendMoneySuccessShown(
          title: 'Transfer sent',
          message:
              'Your money was sent successfully. You can view details in Transactions.',
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SendMoneyStatus.error));
      emitPresentation(
        SendMoneyFailedShown(
          title: 'Transfer failed',
          message:
              'We could not send your money. Your wallet balance was not changed.',
        ),
      );
    } finally {
      emit(state.copyWith(status: SendMoneyStatus.initial));
    }
  }
}
