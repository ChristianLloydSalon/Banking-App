import 'package:banking_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/component/action/app_button.dart';
import '../../../../shared/component/containment/app_container.dart';
import '../../../transaction/presentation/screen/send_money_screen.dart';
import '../../../transaction/presentation/screen/transaction_history_screen.dart';
import '../bloc/wallet_bloc.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) => Skeletonizer(
        enabled:
            state.status.isLoading ||
            (state.status.isInitial && state.wallet == null),
        child: AppContainer(
          borderRadius: BorderRadius.circular(context.spacing.cornerRadius.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.spacing.spacing.sm,
            children: [
              _WalletBalanceHeader(
                balance: state.wallet?.balance.toString() ?? '',
                currency: state.wallet?.currency ?? '',
              ),
              Row(
                spacing: context.spacing.spacing.sm,
                children: [
                  Expanded(
                    child: AppButton(
                      state: AppButtonState.enabled,
                      label: 'Send Money',
                      onPressed: () {
                        context.goNamed(SendMoneyScreen.routeName);
                      },
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      state: AppButtonState.enabled,
                      label: 'Transactions',
                      onPressed: () {
                        context.goNamed(TransactionHistoryScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WalletBalanceHeader extends HookWidget {
  const _WalletBalanceHeader({required this.balance, required this.currency});

  final String balance;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final balanceVisible = useState(true);
    final colors = context.colors;

    return Row(
      spacing: context.spacing.spacing.sm,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.spacing.spacing.xsm,
          children: [
            Row(
              spacing: context.spacing.spacing.xsm,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(currency, style: context.textStyles.outfit.titleXlMedium),
                Text(
                  _balanceLabel(balance, balanceVisible.value),
                  style: context.textStyles.outfit.titleXlMedium,
                ),
              ],
            ),
            Text(
              'Wallet Balance',
              style: context.textStyles.outfit.bodyRegularSm,
            ),
          ],
        ),
        GestureDetector(
          onTap: () => balanceVisible.value = !balanceVisible.value,
          child: Icon(
            balanceVisible.value ? Icons.visibility : Icons.visibility_off,
            color: balanceVisible.value
                ? colors.brandPrimary
                : colors.brandSecondary,
          ),
        ),
      ],
    );
  }
}

String _balanceLabel(String balance, bool visible) {
  if (!visible) return '••••••';
  return balance;
}
