import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../domain/entity/transaction.dart';
import '../../domain/usecase/fetch_transactions.dart';

part '../event/transactions_event.dart';
part '../state/transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc({required FetchTransactions fetchTransactionsUsecase})
    : _fetchTransactionsUsecase = fetchTransactionsUsecase,
      super(TransactionsState()) {
    on<TransactionsRequested>(_onTransactionsRequested);
    on<TransactionsRefreshed>(_onTransactionsRefreshed);
  }

  final FetchTransactions _fetchTransactionsUsecase;

  Future<void> _onTransactionsRequested(
    TransactionsRequested event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: TransactionsStatus.loading));
      final transactions = await _fetchTransactionsUsecase.call(NoParams());
      emit(
        state.copyWith(
          status: TransactionsStatus.success,
          transactions: transactions,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: TransactionsStatus.error));
    } finally {
      emit(state.copyWith(status: TransactionsStatus.initial));
    }
  }

  Future<void> _onTransactionsRefreshed(
    TransactionsRefreshed event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(const TransactionsState());

    add(const TransactionsRequested());
  }
}
