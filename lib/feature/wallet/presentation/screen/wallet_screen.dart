import 'package:banking_app/feature/wallet/presentation/component/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/component/action/app_button.dart';
import '../../../../shared/component/containment/app_container.dart';
import '../../data/di/wallet_service_locator.dart';
import '../bloc/wallet_bloc.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  static const routeName = 'WALLET_SCREEN';
  static const path = '/wallet';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletBloc>(
      create: (context) =>
          WalletBloc(fetchWalletUsecase: fetchWalletUsecase)
            ..add(WalletRequested()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: context.colors.backgroundPrimary,
          body: _WalletScreenContent(),
        ),
      ),
    );
  }
}

class _WalletScreenContent extends StatelessWidget {
  const _WalletScreenContent();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<WalletBloc>().add(WalletRequested());
      },
      child: BlocBuilder<WalletBloc, WalletState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: context.colors.backgroundPrimary,
                title: Text(
                  'Wallet',
                  style: context.textStyles.outfit.title2xlMedium.copyWith(
                    color: context.colors.brandPrimary,
                  ),
                ),
                foregroundColor: context.colors.textPrimary,
                pinned: true,
              ),
              SliverPadding(
                padding: EdgeInsets.all(context.spacing.spacing.base),
                sliver: switch (state.status) {
                  WalletStatus.error => SliverToBoxAdapter(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 520),
                        child: _WalletErrorState(
                          onRetry: () => context
                              .read<WalletBloc>()
                              .add(WalletRequested()),
                        ),
                      ),
                    ),
                  ),
                  _ => SliverToBoxAdapter(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 520),
                        child: const WalletCard(),
                      ),
                    ),
                  ),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WalletErrorState extends StatelessWidget {
  const _WalletErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: context.colors.containerBackgroundSecondary,
      borderRadius: BorderRadius.circular(context.spacing.cornerRadius.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.spacing.spacing.sm,
        children: [
          Row(
            spacing: context.spacing.spacing.xsm,
            children: [
              Icon(
                Icons.error_outline_rounded,
                color: context.colors.brandViolet,
              ),
              Text(
                'Unable to load wallet',
                style: context.textStyles.outfit.titleXlMedium.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ],
          ),
          Text(
            'Check your connection and try again.',
            style: context.textStyles.outfit.bodyRegularSm.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              state: AppButtonState.enabled,
              label: 'Retry',
              onPressed: onRetry,
            ),
          ),
        ],
      ),
    );
  }
}
