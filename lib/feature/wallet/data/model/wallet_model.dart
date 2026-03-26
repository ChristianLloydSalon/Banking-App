import '../../../../core/extension/json_extension.dart';
import '../../domain/entity/wallet.dart';

class WalletModel extends Wallet {
  const WalletModel({required super.balance, required super.currency});

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      balance: json.parseDouble('balance'),
      currency: json.parseString('currency'),
    );
  }
}
