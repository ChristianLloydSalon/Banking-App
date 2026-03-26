part of '../bloc/wallet_bloc.dart';

enum WalletStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == WalletStatus.initial;
  bool get isLoading => this == WalletStatus.loading;
  bool get isSuccess => this == WalletStatus.success;
  bool get isError => this == WalletStatus.error;
}

class WalletState extends Equatable {
  final WalletStatus status;
  final Wallet? wallet;

  const WalletState({this.status = WalletStatus.initial, this.wallet});

  WalletState copyWith({WalletStatus? status, Wallet? wallet}) {
    return WalletState(
      status: status ?? this.status,
      wallet: wallet ?? this.wallet,
    );
  }

  @override
  List<Object?> get props => [status, wallet];
}
