import 'package:banking_app/core/theme/typography/outfit.dart';
import 'package:banking_app/shared/component/communication/app_toast.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import 'core/route/app_route.dart';
import 'core/theme/color/app_colors.dart';
import 'core/theme/spacing/app_spacing.dart';
import 'core/theme/typography/app_text_styles.dart';
import 'feature/auth/di/auth_service_locator.dart';
import 'feature/auth/presentation/bloc/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: _AppMultiBlocProvider(
        child: _AppMultiBlocListener(
          child: MaterialApp.router(
            routerConfig: AppRoute.router,
            title: 'Banking App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              extensions: [
                AppColors.dark(),
                AppSpacing.base(),
                AppTextStyles.base(),
              ],
              textTheme: ThemeData.dark().textTheme.apply(
                bodyColor: AppColors.dark().textPrimary,
                displayColor: AppColors.dark().textPrimary,
                fontFamily: Outfit.fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppMultiBlocProvider extends StatelessWidget {
  const _AppMultiBlocProvider({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(loginUser: loginUser, logoutUser: logoutUser),
        ),
      ],
      child: child,
    );
  }
}

class _AppMultiBlocListener extends StatelessWidget {
  const _AppMultiBlocListener({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocPresentationListener<AuthBloc, AuthPresentationEvent>(
          listener: (context, event) {
            if (!context.mounted) return;

            switch (event) {
              case AuthPresentationLoggedIn():
                AppToast.show(
                  message: event.message,
                  type: AppToastType.success,
                );
                AppRoute.router.refresh();

              case AuthPresentationLoggedOut():
                AppRoute.router.refresh();

              case AuthPresentationError():
                AppToast.show(message: event.error, type: AppToastType.error);
            }
          },
        ),
      ],
      child: child,
    );
  }
}
