import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../domain/entity/user.dart';
import '../../domain/usecase/login_user.dart';
import '../../domain/usecase/logout_user.dart';

part '../event/auth_event.dart';
part '../event/auth_presentation_event.dart';
part '../state/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    with BlocPresentationMixin<AuthState, AuthPresentationEvent> {
  final LoginUser _loginUser;
  final LogoutUser _logoutUser;

  AuthBloc({required LoginUser loginUser, required LogoutUser logoutUser})
    : _loginUser = loginUser,
      _logoutUser = logoutUser,
      super(const AuthState()) {
    on<AuthLoggedIn>(_onAuthLoggedIn);
    on<AuthLoggedOut>(_onAuthLoggedOut);
  }

  Future<void> _onAuthLoggedIn(
    AuthLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final user = await _loginUser.call(
        LoginParams(username: event.username, password: event.password),
      );
      emit(state.copyWith(status: AuthStatus.success, user: user));

      emitPresentation(AuthPresentationLoggedIn('Successfully logged in'));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
      emitPresentation(AuthPresentationError(error: e.toString()));
    } finally {
      emit(state.copyWith(status: AuthStatus.initial));
    }
  }

  Future<void> _onAuthLoggedOut(
    AuthLoggedOut event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      await _logoutUser.call(const NoParams());
      emit(const AuthState());
      emitPresentation(AuthPresentationLoggedOut());
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
      emitPresentation(AuthPresentationError(error: e.toString()));
    } finally {
      emit(state.copyWith(status: AuthStatus.initial));
    }
  }
}
