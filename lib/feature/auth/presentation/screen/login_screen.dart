import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/component/action/app_button.dart';
import '../../../../shared/component/input/app_textfield.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  static const routeName = 'LOGIN_SCREEN';
  static const path = '/login';

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(context.spacing.spacing.base),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: context.spacing.spacing.base,
              children: [
                Text(
                  'Banking App',
                  style: context.textStyles.outfit.title5xlMedium.copyWith(
                    color: context.colors.brandPrimary,
                  ),
                ),
                AppTextField(
                  label: 'Username',
                  placeholder: 'Enter your username',
                  controller: usernameController,
                ),
                AppTextField(
                  label: 'Password',
                  placeholder: 'Enter your password',
                  controller: passwordController,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(context.spacing.spacing.base),
          child: AppButton(
            label: 'Login',
            onPressed: () {
              context.read<AuthBloc>().add(
                AuthLoggedIn(
                  username: usernameController.text,
                  password: passwordController.text,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
