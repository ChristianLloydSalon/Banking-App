import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/auth/presentation/bloc/auth_bloc.dart';
import '../../feature/auth/presentation/screen/login_screen.dart';
import '../../feature/transaction/presentation/screen/send_money_screen.dart';
import '../../feature/transaction/presentation/screen/transaction_history_screen.dart';
import '../../feature/wallet/presentation/screen/wallet_screen.dart';
import '../theme/app_theme.dart';

class AppRoute {
  const AppRoute._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: LoginScreen.path,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.routeName,
        pageBuilder: (context, state) =>
            SlideTransitionPage(key: state.pageKey, child: const LoginScreen()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            _StatefulShellView(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: WalletScreen.path,
                name: WalletScreen.routeName,
                pageBuilder: (context, state) => SlideTransitionPage(
                  key: state.pageKey,
                  child: const WalletScreen(),
                ),
                routes: [
                  GoRoute(
                    path: SendMoneyScreen.path,
                    name: SendMoneyScreen.routeName,
                    pageBuilder: (context, state) => SlideTransitionPage(
                      key: state.pageKey,
                      child: const SendMoneyScreen(),
                    ),
                  ),
                  GoRoute(
                    path: TransactionHistoryScreen.path,
                    name: TransactionHistoryScreen.routeName,
                    pageBuilder: (context, state) => SlideTransitionPage(
                      key: state.pageKey,
                      child: const TransactionHistoryScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final isLoggedIn = authState.user != null;
      final isOnLogin = state.matchedLocation == LoginScreen.path;

      if (!isLoggedIn && !isOnLogin) return LoginScreen.path;
      if (isLoggedIn && isOnLogin) return WalletScreen.path;

      return null;
    },
  );
}

class _StatefulShellView extends StatelessWidget {
  const _StatefulShellView({required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colors.buttonBackgroundPrimaryEnabled,
        onPressed: () {
          context.read<AuthBloc>().add(const AuthLoggedOut());
        },
        child: Icon(
          Icons.logout,
          color: context.colors.buttonTextPrimaryEnabled,
        ),
      ),
    );
  }
}

// Slide Transition Page
class SlideTransitionPage extends Page<void> {
  const SlideTransitionPage({super.key, required this.child});

  final Widget child;

  @override
  Route<void> createRoute(BuildContext context) {
    return PageRouteBuilder<void>(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
    );
  }
}
