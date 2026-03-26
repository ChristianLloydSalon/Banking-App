import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

enum AppButtonState { enabled, disabled }

class AppButton extends StatelessWidget {
  final AppButtonState state;
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? foregroundColor;
  final Color? disabledForegroundColor;

  const AppButton({
    super.key,
    this.state = AppButtonState.enabled,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.foregroundColor,
    this.disabledForegroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.spacing.base,
          vertical: context.spacing.spacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.spacing.cornerRadius.xs),
        ),
        backgroundColor:
            backgroundColor ?? context.colors.buttonBackgroundPrimaryEnabled,
        foregroundColor:
            foregroundColor ?? context.colors.buttonTextPrimaryEnabled,
        disabledBackgroundColor:
            disabledBackgroundColor ??
            context.colors.buttonBackgroundPrimaryDisabled,
        disabledForegroundColor:
            disabledForegroundColor ?? context.colors.buttonTextPrimaryDisabled,
      ),
      onPressed: state == AppButtonState.enabled ? onPressed : null,
      child: Text(
        label,
        style: context.textStyles.outfit.titleMdMedium,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
