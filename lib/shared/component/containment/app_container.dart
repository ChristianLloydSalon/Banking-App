import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(context.spacing.spacing.base),
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ??
            BorderRadius.circular(context.spacing.cornerRadius.base),
        color: color ?? context.colors.containerBackgroundPrimary,
      ),
      child: child,
    );
  }
}
