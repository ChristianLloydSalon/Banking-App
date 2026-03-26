part of '../bloc/transactions_bloc.dart';

enum TransactionsStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == TransactionsStatus.initial;
  bool get isLoading => this == TransactionsStatus.loading;
  bool get isSuccess => this == TransactionsStatus.success;
  bool get isError => this == TransactionsStatus.error;
}

class TransactionsState extends Equatable {
  final TransactionsStatus status;
  final List<Transaction> transactions;

  const TransactionsState({
    this.status = TransactionsStatus.initial,
    this.transactions = const [],
  });

  TransactionsState copyWith({
    TransactionsStatus? status,
    List<Transaction>? transactions,
  }) {
    return TransactionsState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object?> get props => [status, transactions];
}
