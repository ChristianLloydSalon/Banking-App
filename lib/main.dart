import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  await runZonedGuarded(
    () async {
      runApp(const App());
    },
    (error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    },
  );
}
