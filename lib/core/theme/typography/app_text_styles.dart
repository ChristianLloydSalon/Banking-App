import 'package:flutter/material.dart';

import 'outfit.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final Outfit outfit;

  AppTextStyles({required this.outfit});

  factory AppTextStyles.base() {
    return AppTextStyles(outfit: Outfit.instance);
  }

  static AppTextStyles of(BuildContext context) {
    return Theme.of(context).extension<AppTextStyles>() ?? AppTextStyles.base();
  }

  @override
  AppTextStyles copyWith({Outfit? outfit}) {
    return AppTextStyles(outfit: outfit ?? this.outfit);
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }

    return other;
  }
}
