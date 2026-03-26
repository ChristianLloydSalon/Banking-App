part of '../bloc/wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object?> get props => [];
}

class WalletRequested extends WalletEvent {
  const WalletRequested();
}
