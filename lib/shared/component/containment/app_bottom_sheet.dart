import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

Future<void> showAppBottomSheet(BuildContext context, {required Widget child}) {
  return showModalBottomSheet(
    context: context,
    showDragHandle: true,
    backgroundColor: context.colors.modalBackgroundPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(context.spacing.cornerRadius.base),
        topRight: Radius.circular(context.spacing.cornerRadius.base),
      ),
    ),
    builder: (context) => SizedBox(width: double.infinity, child: child),
  );
}
