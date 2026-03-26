import '../../domain/entity/wallet.dart';
import '../../domain/repository/wallet_repository.dart';
import '../data_source/remote/wallet_data_source.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteSource remoteSource;

  WalletRepositoryImpl(this.remoteSource);

  @override
  Future<Wallet> fetchWallet() async {
    final walletModel = await remoteSource.fetchWallet();
    return walletModel.toEntity();
  }
}
