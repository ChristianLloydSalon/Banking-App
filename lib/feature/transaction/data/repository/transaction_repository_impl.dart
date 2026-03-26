import '../../domain/entity/transaction.dart';
import '../../domain/repository/transaction_repository.dart';
import '../data_source/remote/transaction_remote_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteSource _remoteSource;

  TransactionRepositoryImpl(this._remoteSource);

  @override
  Future<Transaction> sendMoney(double amount) async {
    return await _remoteSource.sendMoney(amount);
  }

  @override
  Future<List<Transaction>> fetchTransactions() async {
    return await _remoteSource.fetchTransactions();
  }
}
