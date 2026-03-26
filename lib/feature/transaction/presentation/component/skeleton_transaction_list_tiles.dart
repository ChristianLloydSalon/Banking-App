import 'package:banking_app/shared/component/containment/app_list_tile.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_theme.dart';

class SkeletonTransactionListTiles extends StatelessWidget {
  const SkeletonTransactionListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) =>
          SizedBox(height: context.spacing.spacing.sm),
      itemBuilder: (context, index) {
        return AppListTile.skeleton(
          title: 'Title $index',
          trailing: 'PHP 0.00',
        );
      },
    );
  }
}
