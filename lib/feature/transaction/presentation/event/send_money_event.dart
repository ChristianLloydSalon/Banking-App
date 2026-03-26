part of '../bloc/send_money_bloc.dart';

abstract class SendMoneyEvent extends Equatable {
  const SendMoneyEvent();

  @override
  List<Object?> get props => [];
}

class SendMoneyRequested extends SendMoneyEvent {
  final double amount;
  const SendMoneyRequested({required this.amount});

  @override
  List<Object?> get props => [amount];
}
