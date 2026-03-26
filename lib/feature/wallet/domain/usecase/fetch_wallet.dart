import '../../../../core/usecase/base_usecase.dart';
import '../entity/wallet.dart';
import '../repository/wallet_repository.dart';

class FetchWallet implements BaseUsecase<Wallet, NoParams> {
  final WalletRepository repository;

  FetchWallet(this.repository);

  @override
  Future<Wallet> call(NoParams params) {
    return repository.fetchWallet();
  }
}
