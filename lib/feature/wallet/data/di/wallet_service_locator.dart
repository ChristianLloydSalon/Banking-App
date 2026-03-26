import '../../domain/usecase/fetch_wallet.dart';
import '../data_source/remote/wallet_data_source.dart';
import '../repository/wallet_repository_impl.dart';

final walletRemoteSource = WalletRemoteSource();
final walletRepository = WalletRepositoryImpl(walletRemoteSource);
final fetchWalletUsecase = FetchWallet(walletRepository);
