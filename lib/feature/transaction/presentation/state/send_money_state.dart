part of '../bloc/send_money_bloc.dart';

enum SendMoneyStatus {
  initial,
  loading,
  success,
  error,
}

class SendMoneyState extends Equatable {
  final SendMoneyStatus status;
  const SendMoneyState({this.status = SendMoneyStatus.initial});

  SendMoneyState copyWith({SendMoneyStatus? status}) {
    return SendMoneyState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}