part of '../bloc/transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object?> get props => [];
}

class TransactionsRequested extends TransactionsEvent {
  const TransactionsRequested();
}

class TransactionsRefreshed extends TransactionsEvent {
  const TransactionsRefreshed();
}
