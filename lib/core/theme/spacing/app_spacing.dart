import 'package:flutter/material.dart';

import 'corner_radius.dart';
import 'spacing.dart';

class AppSpacing extends ThemeExtension<AppSpacing> {
  final CornerRadius cornerRadius;
  final Spacing spacing;

  AppSpacing({required this.cornerRadius, required this.spacing});

  factory AppSpacing.base() {
    return AppSpacing(
      cornerRadius: CornerRadius.instance,
      spacing: Spacing.instance,
    );
  }

  static AppSpacing of(BuildContext context) {
    return Theme.of(context).extension<AppSpacing>() ?? AppSpacing.base();
  }

  @override
  AppSpacing copyWith({CornerRadius? cornerRadius, Spacing? spacing}) {
    return AppSpacing(
      cornerRadius: cornerRadius ?? this.cornerRadius,
      spacing: spacing ?? this.spacing,
    );
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) {
      return this;
    }

    return other;
  }
}
