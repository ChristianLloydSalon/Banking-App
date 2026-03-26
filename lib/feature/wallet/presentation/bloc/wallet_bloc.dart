import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../domain/entity/wallet.dart';
import '../../domain/usecase/fetch_wallet.dart';

part '../event/wallet_event.dart';
part '../state/wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final FetchWallet _fetchWalletUsecase;

  WalletBloc({required FetchWallet fetchWalletUsecase})
    : _fetchWalletUsecase = fetchWalletUsecase,
      super(const WalletState()) {
    on<WalletRequested>(_onWalletRequested);
  }

  Future<void> _onWalletRequested(
    WalletRequested event,
    Emitter<WalletState> emit,
  ) async {
    try {
      emit(state.copyWith(status: WalletStatus.loading));
      final wallet = await _fetchWalletUsecase.call(NoParams());
      emit(state.copyWith(status: WalletStatus.success, wallet: wallet));
    } catch (e) {
      emit(state.copyWith(status: WalletStatus.error));
    } finally {
      emit(state.copyWith(status: WalletStatus.initial));
    }
  }
}
