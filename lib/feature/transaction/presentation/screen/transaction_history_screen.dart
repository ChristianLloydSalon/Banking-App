import 'package:banking_app/feature/transaction/presentation/component/skeleton_transaction_list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/component/containment/app_list_tile.dart';
import '../../di/transaction_service_locator.dart';
import '../bloc/transactions_bloc.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  static const routeName = 'TRANSACTION_HISTORY_SCREEN';
  static const path = '/transaction-history';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (context) =>
          TransactionsBloc(fetchTransactionsUsecase: fetchTransactionsUsecase)
            ..add(TransactionsRequested()),
      child: _TransactionHistoryScreenContent(),
    );
  }
}

class _TransactionHistoryScreenContent extends StatelessWidget {
  const _TransactionHistoryScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<TransactionsBloc>().add(TransactionsRefreshed());
        },
        child: BlocBuilder<TransactionsBloc, TransactionsState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: context.colors.backgroundPrimary,
                  title: Text(
                    'Transaction History',
                    style: context.textStyles.outfit.title2xlMedium.copyWith(
                      color: context.colors.brandPrimary,
                    ),
                  ),
                  foregroundColor: context.colors.textPrimary,
                  pinned: true,
                ),
                SliverPadding(
                  padding: EdgeInsets.all(context.spacing.spacing.base),
                  sliver: switch ((state.status, state.transactions.isEmpty)) {
                    (TransactionsStatus.initial, true) => SliverToBoxAdapter(
                      child: SkeletonTransactionListTiles(),
                    ),
                    (TransactionsStatus.loading, _) => SliverToBoxAdapter(
                      child: SkeletonTransactionListTiles(),
                    ),
                    (
                      TransactionsStatus.success || TransactionsStatus.initial,
                      false,
                    ) =>
                      SliverList.separated(
                        itemCount: state.transactions.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: context.spacing.spacing.sm),
                        itemBuilder: (context, index) => AppListTile.base(
                          title: state.transactions[index].title,
                          trailing: state.transactions[index].formattedAmount,
                        ),
                      ),
                    (TransactionsStatus.success, true) => SliverToBoxAdapter(
                      child: const Text('No transaction history'),
                    ),
                    (TransactionsStatus.error, _) => SliverToBoxAdapter(
                      child: const Text('Failed to load transactions'),
                    ),
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
