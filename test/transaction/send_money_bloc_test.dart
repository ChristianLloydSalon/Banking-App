import 'package:banking_app/feature/transaction/domain/usecase/send_money.dart';
import 'package:banking_app/feature/transaction/domain/entity/transaction.dart';
import 'package:banking_app/feature/transaction/presentation/bloc/send_money_bloc.dart';
import 'package:bloc_presentation_test/bloc_presentation_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSendMoney extends Mock implements SendMoney {}

class _FakeSendMoneyParams extends Fake implements SendMoneyParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeSendMoneyParams());
  });

  group('Transaction module - SendMoneyBloc', () {
    late _MockSendMoney sendMoney;

    setUp(() {
      sendMoney = _MockSendMoney();
    });

    blocTest<SendMoneyBloc, SendMoneyState>(
      'Given send money succeeds When SendMoneyRequested Then emits loading -> success -> initial',
      build: () {
        when(() => sendMoney.call(any())).thenAnswer(
          (_) async => const Transaction(
            id: '1',
            title: 'Send Money',
            amount: 100,
          ),
        );
        return SendMoneyBloc(sendMoneyUsecase: sendMoney);
      },
      act: (bloc) => bloc.add(const SendMoneyRequested(amount: 100)),
      expect: () => [
        const SendMoneyState(status: SendMoneyStatus.loading),
        const SendMoneyState(status: SendMoneyStatus.success),
        const SendMoneyState(status: SendMoneyStatus.initial),
      ],
      verify: (_) {
        verify(() => sendMoney.call(any())).called(1);
      },
    );

    blocPresentationTest<SendMoneyBloc, SendMoneyState, SendMoneyPresentationEvent>(
      'Given send money succeeds When SendMoneyRequested Then shows Success bottom-sheet event',
      build: () {
        when(() => sendMoney.call(any())).thenAnswer(
          (_) async => const Transaction(
            id: '1',
            title: 'Send Money',
            amount: 100,
          ),
        );
        return SendMoneyBloc(sendMoneyUsecase: sendMoney);
      },
      act: (bloc) => bloc.add(const SendMoneyRequested(amount: 100)),
      expectPresentation: () => [
        const SendMoneySuccessShown(
          title: 'Transfer sent',
          message:
              'Your money was sent successfully. You can view details in Transactions.',
        ),
      ],
    );

    blocTest<SendMoneyBloc, SendMoneyState>(
      'Given send money fails When SendMoneyRequested Then emits loading -> error -> initial',
      build: () {
        when(() => sendMoney.call(any())).thenThrow(Exception('boom'));
        return SendMoneyBloc(sendMoneyUsecase: sendMoney);
      },
      act: (bloc) => bloc.add(const SendMoneyRequested(amount: 100)),
      expect: () => [
        const SendMoneyState(status: SendMoneyStatus.loading),
        const SendMoneyState(status: SendMoneyStatus.error),
        const SendMoneyState(status: SendMoneyStatus.initial),
      ],
    );

    blocPresentationTest<SendMoneyBloc, SendMoneyState, SendMoneyPresentationEvent>(
      'Given send money fails When SendMoneyRequested Then shows Error bottom-sheet event',
      build: () {
        when(() => sendMoney.call(any())).thenThrow(Exception('boom'));
        return SendMoneyBloc(sendMoneyUsecase: sendMoney);
      },
      act: (bloc) => bloc.add(const SendMoneyRequested(amount: 100)),
      expectPresentation: () => [
        const SendMoneyFailedShown(
          title: 'Transfer failed',
          message:
              'We could not send your money. Your wallet balance was not changed.',
        ),
      ],
    );
  });
}

