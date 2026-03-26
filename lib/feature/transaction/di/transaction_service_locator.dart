import '../../../core/network/api_client.dart';
import '../data/data_source/remote/transaction_remote_source.dart';
import '../data/repository/transaction_repository_impl.dart';
import '../domain/usecase/fetch_transactions.dart';
import '../domain/usecase/send_money.dart';

final transactionRemoteSource = TransactionRemoteSource(apiClient);
final transactionRepository = TransactionRepositoryImpl(
  transactionRemoteSource,
);
final sendMoneyUsecase = SendMoney(transactionRepository);
final fetchTransactionsUsecase = FetchTransactions(transactionRepository);
