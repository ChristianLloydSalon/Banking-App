import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final String title;
  final double amount;

  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
  });

  String get formattedAmount => 'PHP ${amount.toStringAsFixed(2)}';

  @override
  List<Object?> get props => [id, title, amount];
}
