part of '../bloc/send_money_bloc.dart';

abstract class SendMoneyPresentationEvent extends Equatable {
  const SendMoneyPresentationEvent();

  @override
  List<Object?> get props => [];
}

class SendMoneyFailedShown extends SendMoneyPresentationEvent {
  const SendMoneyFailedShown({required this.title, required this.message});

  final String title;
  final String message;
}

class SendMoneySuccessShown extends SendMoneyPresentationEvent {
  const SendMoneySuccessShown({required this.title, required this.message});

  final String title;
  final String message;
}
