import 'package:banking_app/core/usecase/base_usecase.dart';
import 'package:banking_app/feature/transaction/domain/entity/transaction.dart';
import 'package:banking_app/feature/transaction/domain/usecase/fetch_transactions.dart';
import 'package:banking_app/feature/transaction/presentation/bloc/transactions_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFetchTransactions extends Mock implements FetchTransactions {}

class _FakeNoParams extends Fake implements NoParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeNoParams());
  });

  const t1 = Transaction(id: '1', title: 'Send Money', amount: 100);
  const t2 = Transaction(id: '2', title: 'Send Money', amount: 250.5);

  group('Transaction module - TransactionsBloc', () {
    late _MockFetchTransactions fetchTransactions;

    setUp(() {
      fetchTransactions = _MockFetchTransactions();
    });

    blocTest<TransactionsBloc, TransactionsState>(
      'Given fetch succeeds When TransactionsRequested Then emits loading -> success -> initial with transactions',
      build: () {
        when(() => fetchTransactions.call(any()))
            .thenAnswer((_) async => const [t1, t2]);
        return TransactionsBloc(fetchTransactionsUsecase: fetchTransactions);
      },
      act: (bloc) => bloc.add(const TransactionsRequested()),
      expect: () => [
        const TransactionsState(status: TransactionsStatus.loading),
        const TransactionsState(
          status: TransactionsStatus.success,
          transactions: [t1, t2],
        ),
        const TransactionsState(
          status: TransactionsStatus.initial,
          transactions: [t1, t2],
        ),
      ],
      verify: (_) {
        verify(() => fetchTransactions.call(any())).called(1);
      },
    );

    blocTest<TransactionsBloc, TransactionsState>(
      'Given fetch fails When TransactionsRequested Then emits loading -> error -> initial',
      build: () {
        when(() => fetchTransactions.call(any())).thenThrow(Exception('boom'));
        return TransactionsBloc(fetchTransactionsUsecase: fetchTransactions);
      },
      act: (bloc) => bloc.add(const TransactionsRequested()),
      expect: () => [
        const TransactionsState(status: TransactionsStatus.loading),
        const TransactionsState(status: TransactionsStatus.error),
        const TransactionsState(status: TransactionsStatus.initial),
      ],
    );

    blocTest<TransactionsBloc, TransactionsState>(
      'Given existing transactions When TransactionsRefreshed Then resets state and re-fetches',
      build: () {
        when(() => fetchTransactions.call(any()))
            .thenAnswer((_) async => const [t1]);
        return TransactionsBloc(fetchTransactionsUsecase: fetchTransactions);
      },
      seed: () => const TransactionsState(
        status: TransactionsStatus.success,
        transactions: [t1, t2],
      ),
      act: (bloc) => bloc.add(const TransactionsRefreshed()),
      expect: () => [
        const TransactionsState(),
        const TransactionsState(status: TransactionsStatus.loading),
        const TransactionsState(
          status: TransactionsStatus.success,
          transactions: [t1],
        ),
        const TransactionsState(
          status: TransactionsStatus.initial,
          transactions: [t1],
        ),
      ],
      verify: (_) {
        verify(() => fetchTransactions.call(any())).called(1);
      },
    );
  });
}

