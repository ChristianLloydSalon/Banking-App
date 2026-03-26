import '../../../../core/extension/json_extension.dart';
import '../../domain/entity/wallet.dart';

class WalletModel {
  final double balance;
  final String currency;

  WalletModel({required this.balance, required this.currency});

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      balance: json.parseDouble('balance'),
      currency: json.parseString('currency'),
    );
  }

  Wallet toEntity() {
    return Wallet(balance: balance, currency: currency);
  }
}
