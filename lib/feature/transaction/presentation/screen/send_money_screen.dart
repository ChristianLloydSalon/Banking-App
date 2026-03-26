import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/component/action/app_button.dart';
import '../../../../shared/component/containment/app_bottom_sheet.dart';
import '../../../../shared/component/containment/feedback_bottom_sheet_content.dart';
import '../../../../shared/component/input/app_textfield.dart';
import '../../di/transaction_service_locator.dart';
import '../bloc/send_money_bloc.dart';

class SendMoneyScreen extends HookWidget {
  const SendMoneyScreen({super.key});

  static const routeName = 'SEND_MONEY_SCREEN';
  static const path = '/send-money';

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();

    return BlocProvider(
      create: (context) => SendMoneyBloc(sendMoneyUsecase: sendMoneyUsecase),
      child: Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: _SendMoneyForm(amountController: amountController),
      ),
    );
  }
}

class _SendMoneyForm extends StatelessWidget {
  const _SendMoneyForm({required this.amountController});

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return BlocPresentationListener<SendMoneyBloc, SendMoneyPresentationEvent>(
      listener: (context, event) {
        amountController.clear();

        if (event is SendMoneyFailedShown) {
          showAppBottomSheet(
            context,
            child: FeedbackBottomSheetContent(
              variant: FeedbackBottomSheetContentVariant.error,
              title: event.title,
              description: event.message,
              buttonLabel: 'OK',
            ),
          );
        }
        if (event is SendMoneySuccessShown) {
          showAppBottomSheet(
            context,
            child: FeedbackBottomSheetContent(
              variant: FeedbackBottomSheetContentVariant.success,
              title: event.title,
              description: event.message,
              buttonLabel: 'OK',
            ),
          );
        }
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.spacing.spacing.base),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: context.spacing.spacing.base,
            children: [
              Text(
                'Send Money',
                textAlign: TextAlign.center,
                style: context.textStyles.outfit.title4xlMedium.copyWith(
                  color: context.colors.brandPrimary,
                ),
              ),
              AppTextField(
                label: 'Amount',
                placeholder: 'Enter amount',
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                inputFormatters: const [_AmountTextInputFormatter()],
              ),
              Text(
                'Funds are transferred instantly from your wallet balance.',
                textAlign: TextAlign.center,
                style: context.textStyles.outfit.bodyRegularSm.copyWith(
                  color: context.colors.feedbackBackgroundInformative,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: amountController,
                builder: (context, value, child) {
                  final parsedAmount = double.tryParse(value.text);
                  final canSubmit = parsedAmount != null && parsedAmount > 0;

                  return SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      state: canSubmit
                          ? AppButtonState.enabled
                          : AppButtonState.disabled,
                      label: 'Send',
                      onPressed: () {
                        if (!canSubmit) return;

                        context.read<SendMoneyBloc>().add(
                          SendMoneyRequested(amount: parsedAmount),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmountTextInputFormatter extends TextInputFormatter {
  const _AmountTextInputFormatter();

  static final _allow = RegExp(r'^\d*\.?\d*$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;
    if (!_allow.hasMatch(text)) return oldValue;

    final dotCount = '.'.allMatches(text).length;
    if (dotCount > 1) return oldValue;

    return newValue;
  }
}
