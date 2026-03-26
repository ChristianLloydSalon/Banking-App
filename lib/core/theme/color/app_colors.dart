import 'package:flutter/material.dart';

import 'dark.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color brandPrimary;
  final Color brandSecondary;
  final Color brandTertiary;
  final Color brandPurple;
  final Color brandViolet;
  final Color backgroundPrimary;
  final Color inputBackgroundPrimary;
  final Color buttonBackgroundPrimaryEnabled;
  final Color buttonBackgroundPrimaryDisabled;
  final Color containerBackgroundPrimary;
  final Color containerBackgroundSecondary;
  final Color containerBackgroundTertiary;
  final Color feedbackBackgroundInformative;
  final Color feedbackBackgroundPositive;
  final Color feedbackBackgroundWarning;
  final Color feedbackBackgroundNegative;
  final Color feedbackBackgroundDisabled;
  final Color modalBackgroundPrimary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color buttonTextPrimaryEnabled;
  final Color buttonTextPrimaryInversed;
  final Color buttonTextPrimaryDisabled;
  final Color linkPrimary;

  AppColors({
    required this.brandPrimary,
    required this.brandSecondary,
    required this.brandTertiary,
    required this.brandPurple,
    required this.brandViolet,
    required this.backgroundPrimary,
    required this.inputBackgroundPrimary,
    required this.buttonBackgroundPrimaryEnabled,
    required this.buttonBackgroundPrimaryDisabled,
    required this.containerBackgroundPrimary,
    required this.containerBackgroundSecondary,
    required this.containerBackgroundTertiary,
    required this.feedbackBackgroundInformative,
    required this.feedbackBackgroundPositive,
    required this.feedbackBackgroundWarning,
    required this.feedbackBackgroundNegative,
    required this.feedbackBackgroundDisabled,
    required this.modalBackgroundPrimary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.buttonTextPrimaryEnabled,
    required this.buttonTextPrimaryInversed,
    required this.buttonTextPrimaryDisabled,
    required this.linkPrimary,
  });

  factory AppColors.dark() {
    return AppColors(
      brandPrimary: DarkPaletteColors.brandPrimary,
      brandSecondary: DarkPaletteColors.brandSecondary,
      brandTertiary: DarkPaletteColors.brandTertiary,
      brandPurple: DarkPaletteColors.brandPurple,
      brandViolet: DarkPaletteColors.brandViolet,
      backgroundPrimary: DarkPaletteColors.backgroundPrimary,
      inputBackgroundPrimary: DarkPaletteColors.inputBackgroundPrimary,
      buttonBackgroundPrimaryEnabled:
          DarkPaletteColors.buttonBackgroundPrimaryEnabled,
      buttonBackgroundPrimaryDisabled:
          DarkPaletteColors.buttonBackgroundPrimaryDisabled,
      containerBackgroundPrimary: DarkPaletteColors.containerBackgroundPrimary,
      containerBackgroundSecondary:
          DarkPaletteColors.containerBackgroundSecondary,
      containerBackgroundTertiary:
          DarkPaletteColors.containerBackgroundTertiary,
      feedbackBackgroundInformative:
          DarkPaletteColors.feedbackBackgroundInformative,
      feedbackBackgroundPositive: DarkPaletteColors.feedbackBackgroundPositive,
      feedbackBackgroundWarning: DarkPaletteColors.feedbackBackgroundWarning,
      feedbackBackgroundNegative: DarkPaletteColors.feedbackBackgroundNegative,
      feedbackBackgroundDisabled: DarkPaletteColors.feedbackBackgroundDisabled,
      modalBackgroundPrimary: DarkPaletteColors.modalBackgroundPrimary,
      textPrimary: DarkPaletteColors.textPrimary,
      textSecondary: DarkPaletteColors.textSecondary,
      textTertiary: DarkPaletteColors.textTertiary,
      buttonTextPrimaryEnabled: DarkPaletteColors.buttonTextPrimaryEnabled,
      buttonTextPrimaryInversed: DarkPaletteColors.buttonTextPrimaryInversed,
      buttonTextPrimaryDisabled: DarkPaletteColors.buttonTextPrimaryDisabled,
      linkPrimary: DarkPaletteColors.linkPrimary,
    );
  }

  static AppColors of(BuildContext context) {
    return Theme.of(context).extension<AppColors>() ?? AppColors.dark();
  }

  @override
  AppColors copyWith({
    Color? brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandPurple,
    Color? brandViolet,
    Color? backgroundPrimary,
    Color? inputBackgroundPrimary,
    Color? buttonBackgroundPrimaryEnabled,
    Color? buttonBackgroundPrimaryDisabled,
    Color? containerBackgroundPrimary,
    Color? containerBackgroundSecondary,
    Color? containerBackgroundTertiary,
    Color? feedbackBackgroundInformative,
    Color? feedbackBackgroundPositive,
    Color? feedbackBackgroundWarning,
    Color? feedbackBackgroundNegative,
    Color? feedbackBackgroundDisabled,
    Color? modalBackgroundPrimary,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? buttonTextPrimaryEnabled,
    Color? buttonTextPrimaryInversed,
    Color? buttonTextPrimaryDisabled,
    Color? linkPrimary,
  }) {
    return AppColors(
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      brandTertiary: brandTertiary ?? this.brandTertiary,
      brandPurple: brandPurple ?? this.brandPurple,
      brandViolet: brandViolet ?? this.brandViolet,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      inputBackgroundPrimary:
          inputBackgroundPrimary ?? this.inputBackgroundPrimary,
      buttonBackgroundPrimaryEnabled:
          buttonBackgroundPrimaryEnabled ?? this.buttonBackgroundPrimaryEnabled,
      buttonBackgroundPrimaryDisabled:
          buttonBackgroundPrimaryDisabled ??
          this.buttonBackgroundPrimaryDisabled,
      containerBackgroundPrimary:
          containerBackgroundPrimary ?? this.containerBackgroundPrimary,
      containerBackgroundSecondary:
          containerBackgroundSecondary ?? this.containerBackgroundSecondary,
      containerBackgroundTertiary:
          containerBackgroundTertiary ?? this.containerBackgroundTertiary,
      feedbackBackgroundInformative:
          feedbackBackgroundInformative ?? this.feedbackBackgroundInformative,
      feedbackBackgroundPositive:
          feedbackBackgroundPositive ?? this.feedbackBackgroundPositive,
      feedbackBackgroundWarning:
          feedbackBackgroundWarning ?? this.feedbackBackgroundWarning,
      feedbackBackgroundNegative:
          feedbackBackgroundNegative ?? this.feedbackBackgroundNegative,
      feedbackBackgroundDisabled:
          feedbackBackgroundDisabled ?? this.feedbackBackgroundDisabled,
      modalBackgroundPrimary:
          modalBackgroundPrimary ?? this.modalBackgroundPrimary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      buttonTextPrimaryEnabled:
          buttonTextPrimaryEnabled ?? this.buttonTextPrimaryEnabled,
      buttonTextPrimaryInversed:
          buttonTextPrimaryInversed ?? this.buttonTextPrimaryInversed,
      buttonTextPrimaryDisabled:
          buttonTextPrimaryDisabled ?? this.buttonTextPrimaryDisabled,
      linkPrimary: linkPrimary ?? this.linkPrimary,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      brandTertiary: Color.lerp(brandTertiary, other.brandTertiary, t)!,
      brandPurple: Color.lerp(brandPurple, other.brandPurple, t)!,
      brandViolet: Color.lerp(brandViolet, other.brandViolet, t)!,
      backgroundPrimary: Color.lerp(
        backgroundPrimary,
        other.backgroundPrimary,
        t,
      )!,
      inputBackgroundPrimary: Color.lerp(
        inputBackgroundPrimary,
        other.inputBackgroundPrimary,
        t,
      )!,
      buttonBackgroundPrimaryEnabled: Color.lerp(
        buttonBackgroundPrimaryEnabled,
        other.buttonBackgroundPrimaryEnabled,
        t,
      )!,
      buttonBackgroundPrimaryDisabled: Color.lerp(
        buttonBackgroundPrimaryDisabled,
        other.buttonBackgroundPrimaryDisabled,
        t,
      )!,
      containerBackgroundPrimary: Color.lerp(
        containerBackgroundPrimary,
        other.containerBackgroundPrimary,
        t,
      )!,
      containerBackgroundSecondary: Color.lerp(
        containerBackgroundSecondary,
        other.containerBackgroundSecondary,
        t,
      )!,
      containerBackgroundTertiary: Color.lerp(
        containerBackgroundTertiary,
        other.containerBackgroundTertiary,
        t,
      )!,
      feedbackBackgroundInformative: Color.lerp(
        feedbackBackgroundInformative,
        other.feedbackBackgroundInformative,
        t,
      )!,
      feedbackBackgroundPositive: Color.lerp(
        feedbackBackgroundPositive,
        other.feedbackBackgroundPositive,
        t,
      )!,
      feedbackBackgroundWarning: Color.lerp(
        feedbackBackgroundWarning,
        other.feedbackBackgroundWarning,
        t,
      )!,
      feedbackBackgroundNegative: Color.lerp(
        feedbackBackgroundNegative,
        other.feedbackBackgroundNegative,
        t,
      )!,
      feedbackBackgroundDisabled: Color.lerp(
        feedbackBackgroundDisabled,
        other.feedbackBackgroundDisabled,
        t,
      )!,
      modalBackgroundPrimary: Color.lerp(
        modalBackgroundPrimary,
        other.modalBackgroundPrimary,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      buttonTextPrimaryEnabled: Color.lerp(
        buttonTextPrimaryEnabled,
        other.buttonTextPrimaryEnabled,
        t,
      )!,
      buttonTextPrimaryInversed: Color.lerp(
        buttonTextPrimaryInversed,
        other.buttonTextPrimaryInversed,
        t,
      )!,
      buttonTextPrimaryDisabled: Color.lerp(
        buttonTextPrimaryDisabled,
        other.buttonTextPrimaryDisabled,
        t,
      )!,
      linkPrimary: Color.lerp(linkPrimary, other.linkPrimary, t)!,
    );
  }
}
