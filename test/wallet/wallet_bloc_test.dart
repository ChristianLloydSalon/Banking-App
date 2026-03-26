import 'package:banking_app/core/usecase/base_usecase.dart';
import 'package:banking_app/feature/wallet/domain/entity/wallet.dart';
import 'package:banking_app/feature/wallet/domain/usecase/fetch_wallet.dart';
import 'package:banking_app/feature/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFetchWallet extends Mock implements FetchWallet {}

class _FakeNoParams extends Fake implements NoParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeNoParams());
  });

  const wallet = Wallet(balance: 500.0, currency: 'PHP');

  group('Wallet module - WalletBloc', () {
    late _MockFetchWallet fetchWallet;

    setUp(() {
      fetchWallet = _MockFetchWallet();
    });

    blocTest<WalletBloc, WalletState>(
      'Given fetch succeeds When WalletRequested Then emits loading -> success -> initial with wallet',
      build: () {
        when(() => fetchWallet.call(any())).thenAnswer((_) async => wallet);
        return WalletBloc(fetchWalletUsecase: fetchWallet);
      },
      act: (bloc) => bloc.add(const WalletRequested()),
      expect: () => [
        const WalletState(status: WalletStatus.loading),
        const WalletState(status: WalletStatus.success, wallet: wallet),
        const WalletState(status: WalletStatus.initial, wallet: wallet),
      ],
      verify: (_) {
        verify(() => fetchWallet.call(any())).called(1);
      },
    );

    blocTest<WalletBloc, WalletState>(
      'Given fetch fails When WalletRequested Then emits loading -> error -> initial',
      build: () {
        when(() => fetchWallet.call(any())).thenThrow(Exception('boom'));
        return WalletBloc(fetchWalletUsecase: fetchWallet);
      },
      act: (bloc) => bloc.add(const WalletRequested()),
      expect: () => [
        const WalletState(status: WalletStatus.loading),
        const WalletState(status: WalletStatus.error),
        const WalletState(status: WalletStatus.initial),
      ],
    );
  });
}

