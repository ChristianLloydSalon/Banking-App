import '../../../../core/usecase/base_usecase.dart';
import '../entity/transaction.dart';
import '../repository/transaction_repository.dart';

class SendMoney implements BaseUsecase<Transaction, SendMoneyParams> {
  final TransactionRepository repository;

  SendMoney(this.repository);

  @override
  Future<Transaction> call(SendMoneyParams params) {
    return repository.sendMoney(params.amount);
  }
}

class SendMoneyParams {
  final double amount;

  const SendMoneyParams({required this.amount});
}
