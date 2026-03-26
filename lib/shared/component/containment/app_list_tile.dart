import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  final String title;
  final String trailing;
  final bool isSkeleton;

  const AppListTile.base({
    required this.title,
    required this.trailing,
    super.key,
  }) : isSkeleton = false;

  const AppListTile.skeleton({
    required this.title,
    required this.trailing,
    super.key,
  }) : isSkeleton = true;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isSkeleton,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.spacing.cornerRadius.xs),
        ),
        title: Text(
          title,
          style: context.textStyles.outfit.titleSmMedium.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        trailing: Text(
          trailing,
          style: context.textStyles.outfit.titleSmMedium.copyWith(
            color: context.colors.brandPrimary,
          ),
        ),
        tileColor: context.colors.containerBackgroundPrimary,
      ),
    );
  }
}
