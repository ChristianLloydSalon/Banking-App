import '../../../../core/extension/json_extension.dart';
import '../../domain/entity/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.id,
    required super.title,
    required super.amount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json.parseString('id'),
      title: json.parseString('title'),
      amount: json.parseDouble('body'),
    );
  }
}
