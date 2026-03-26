import '../entity/wallet.dart';

abstract interface class WalletRepository {
  Future<Wallet> fetchWallet();
}
