import '../entity/transaction.dart';

abstract class TransactionRepository {
  Future<Transaction> sendMoney(double amount);

  Future<List<Transaction>> fetchTransactions();
}
