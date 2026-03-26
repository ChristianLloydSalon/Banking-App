import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/domain/entity/user.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, User?>(
      selector: (state) => state.user,
      builder: (context, user) {
        return Padding(
          padding: EdgeInsets.all(context.spacing.spacing.base),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.spacing.spacing.sm,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Welcome back, '),
                    TextSpan(
                      text: user?.name ?? '',
                      style: context.textStyles.outfit.title3xlMedium.copyWith(
                        color: context.colors.brandPrimary,
                      ),
                    ),
                    const TextSpan(text: '!'),
                  ],
                ),
                style: context.textStyles.outfit.title3xlMedium.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              Text(
                'Username: ${user?.username}',
                style: context.textStyles.outfit.bodyRegularMd.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
