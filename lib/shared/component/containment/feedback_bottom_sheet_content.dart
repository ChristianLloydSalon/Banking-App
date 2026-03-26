import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../action/app_button.dart';

enum FeedbackBottomSheetContentVariant { success, error }

class FeedbackBottomSheetContent extends StatelessWidget {
  const FeedbackBottomSheetContent({
    super.key,
    required this.variant,
    required this.title,
    required this.description,
    required this.buttonLabel,
  });

  final FeedbackBottomSheetContentVariant variant;
  final String title;
  final String description;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    final isSuccess = variant == FeedbackBottomSheetContentVariant.success;
    final icon = isSuccess
        ? Icons.check_circle_rounded
        : Icons.error_outline_rounded;
    final iconColor = isSuccess
        ? context.colors.feedbackBackgroundPositive
        : context.colors.feedbackBackgroundNegative;

    return Padding(
      padding: EdgeInsets.all(context.spacing.spacing.base),
      child: Column(
        spacing: context.spacing.spacing.base,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 44, color: iconColor),
          Text(
            title,
            style: context.textStyles.outfit.title2xlMedium.copyWith(
              color: isSuccess
                  ? context.colors.brandPrimary
                  : context.colors.brandViolet,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing.spacing.base,
            ),
            child: Text(
              description,
              style: context.textStyles.outfit.bodyRegularLg.copyWith(
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              label: buttonLabel,
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: isSuccess
                  ? context.colors.feedbackBackgroundPositive
                  : context.colors.feedbackBackgroundNegative,
              foregroundColor: isSuccess
                  ? context.colors.buttonTextPrimaryEnabled
                  : context.colors.buttonTextPrimaryInversed,
            ),
          ),
        ],
      ),
    );
  }
}
