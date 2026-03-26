import 'package:flutter/material.dart';

import 'color/app_colors.dart';
import 'spacing/app_spacing.dart';
import 'typography/app_text_styles.dart';

extension AppTheme on BuildContext {
  AppColors get colors => AppColors.of(this);
  AppSpacing get spacing => AppSpacing.of(this);
  AppTextStyles get textStyles => AppTextStyles.of(this);
}
