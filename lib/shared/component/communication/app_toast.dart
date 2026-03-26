import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

enum AppToastType { informative, success, warning, error }

class AppToast {
  const AppToast._();

  static void show({required String message, required AppToastType type}) {
    toastification.dismissAll(delayForAnimation: false);

    toastification.show(
      type: switch (type) {
        AppToastType.error => ToastificationType.error,
        AppToastType.informative => ToastificationType.info,
        AppToastType.success => ToastificationType.success,
        AppToastType.warning => ToastificationType.warning,
      },
      style: ToastificationStyle.flatColored,
      title: Text(message),
      autoCloseDuration: Duration(seconds: 3),
    );
  }
}
