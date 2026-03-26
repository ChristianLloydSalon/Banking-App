import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_theme.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
  });

  final String label;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: context.textStyles.outfit.bodyRegularLg.copyWith(
        color: context.colors.textPrimary,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: context.textStyles.outfit.title2xlMedium.copyWith(
          color: context.colors.textPrimary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: context.textStyles.outfit.bodyRegularLg.copyWith(
          color: context.colors.textTertiary,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.textSecondary, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.feedbackBackgroundPositive,
            width: 1,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.feedbackBackgroundNegative,
            width: 1,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.feedbackBackgroundNegative,
            width: 1,
          ),
        ),
      ),
    );
  }
}
