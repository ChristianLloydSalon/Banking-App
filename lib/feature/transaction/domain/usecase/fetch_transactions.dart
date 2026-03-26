import '../../../../core/usecase/base_usecase.dart';
import '../entity/transaction.dart';
import '../repository/transaction_repository.dart';

class FetchTransactions implements BaseUsecase<List<Transaction>, NoParams> {
  final TransactionRepository repository;

  FetchTransactions(this.repository);

  @override
  Future<List<Transaction>> call(NoParams params) {
    return repository.fetchTransactions();
  }
}
