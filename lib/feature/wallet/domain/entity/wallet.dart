import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final double balance;
  final String currency;

  const Wallet({required this.balance, required this.currency});

  @override
  List<Object?> get props => [balance, currency];
}
