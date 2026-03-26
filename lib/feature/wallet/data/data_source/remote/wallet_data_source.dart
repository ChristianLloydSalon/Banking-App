import '../../model/wallet_model.dart';

class WalletRemoteSource {
  Future<WalletModel> fetchWallet() async {
    // Mock fetch wallet
    return await Future.delayed(
      const Duration(seconds: 1),
      () => WalletModel(balance: 500.00, currency: 'PHP'),
    );
  }
}
