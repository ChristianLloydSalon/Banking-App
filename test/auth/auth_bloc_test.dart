import 'package:banking_app/core/usecase/base_usecase.dart';
import 'package:banking_app/feature/auth/domain/entity/user.dart';
import 'package:banking_app/feature/auth/domain/usecase/login_user.dart';
import 'package:banking_app/feature/auth/domain/usecase/logout_user.dart';
import 'package:banking_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_presentation_test/bloc_presentation_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoginUser extends Mock implements LoginUser {}

class _MockLogoutUser extends Mock implements LogoutUser {}

class _FakeLoginParams extends Fake implements LoginParams {}

class _FakeNoParams extends Fake implements NoParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeLoginParams());
    registerFallbackValue(_FakeNoParams());
  });

  const user = User(
    id: 1,
    name: 'John Doe',
    username: 'john_doe',
    email: 'john.doe@example.com',
    phone: '+1234567890',
    website: 'example.com',
  );

  group('Auth module - AuthBloc', () {
    late _MockLoginUser loginUser;
    late _MockLogoutUser logoutUser;

    setUp(() {
      loginUser = _MockLoginUser();
      logoutUser = _MockLogoutUser();
    });

    blocTest<AuthBloc, AuthState>(
      'Given login succeeds When AuthLoggedIn Then emits loading -> success -> initial with user',
      build: () {
        when(() => loginUser.call(any())).thenAnswer((_) async => user);
        when(() => logoutUser.call(any())).thenAnswer((_) async {});
        return AuthBloc(loginUser: loginUser, logoutUser: logoutUser);
      },
      act: (bloc) =>
          bloc.add(const AuthLoggedIn(username: 'any', password: 'any')),
      expect: () => [
        const AuthState(status: AuthStatus.loading),
        const AuthState(status: AuthStatus.success, user: user),
        const AuthState(status: AuthStatus.initial, user: user),
      ],
      verify: (_) {
        verify(() => loginUser.call(any())).called(1);
      },
    );

    blocPresentationTest<AuthBloc, AuthState, AuthPresentationEvent>(
      'Given login succeeds When AuthLoggedIn Then emits LoggedIn presentation event',
      build: () {
        when(() => loginUser.call(any())).thenAnswer((_) async => user);
        when(() => logoutUser.call(any())).thenAnswer((_) async {});
        return AuthBloc(loginUser: loginUser, logoutUser: logoutUser);
      },
      act: (bloc) =>
          bloc.add(const AuthLoggedIn(username: 'any', password: 'any')),
      expectPresentation: () => [
        const AuthPresentationLoggedIn('Successfully logged in'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Given login fails When AuthLoggedIn Then emits loading -> error -> initial',
      build: () {
        when(() => loginUser.call(any())).thenThrow(Exception('boom'));
        when(() => logoutUser.call(any())).thenAnswer((_) async {});
        return AuthBloc(loginUser: loginUser, logoutUser: logoutUser);
      },
      act: (bloc) =>
          bloc.add(const AuthLoggedIn(username: 'any', password: 'any')),
      expect: () => [
        const AuthState(status: AuthStatus.loading),
        const AuthState(status: AuthStatus.error),
        const AuthState(status: AuthStatus.initial),
      ],
    );

    blocPresentationTest<AuthBloc, AuthState, AuthPresentationEvent>(
      'Given login fails When AuthLoggedIn Then emits Error presentation event',
      build: () {
        when(() => loginUser.call(any())).thenThrow(Exception('boom'));
        when(() => logoutUser.call(any())).thenAnswer((_) async {});
        return AuthBloc(loginUser: loginUser, logoutUser: logoutUser);
      },
      act: (bloc) =>
          bloc.add(const AuthLoggedIn(username: 'any', password: 'any')),
      expectPresentation: () => [
        const AuthPresentationError(error: 'Exception: boom'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Given user is logged in When AuthLoggedOut Then clears user',
      build: () {
        when(() => loginUser.call(any())).thenAnswer((_) async => user);
        when(() => logoutUser.call(any())).thenAnswer((_) async {});
        return AuthBloc(loginUser: loginUser, logoutUser: logoutUser);
      },
      seed: () => const AuthState(status: AuthStatus.initial, user: user),
      act: (bloc) => bloc.add(const AuthLoggedOut()),
      expect: () => [
        const AuthState(status: AuthStatus.loading, user: user),
        const AuthState(status: AuthStatus.initial),
      ],
      verify: (_) {
        verify(() => logoutUser.call(any())).called(1);
      },
    );

    blocPresentationTest<AuthBloc, AuthState, AuthPresentationEvent>(
      'Given user is logged in When AuthLoggedOut Then emits LoggedOut presentation event',
      build: () {
        when(() => loginUser.call(any())).thenAnswer((_) async => user);
        when(() => logoutUser.call(any())).thenAnswer((_) async {});
        return AuthBloc(loginUser: loginUser, logoutUser: logoutUser);
      },
      seed: () => const AuthState(status: AuthStatus.initial, user: user),
      act: (bloc) => bloc.add(const AuthLoggedOut()),
      expectPresentation: () => [
        const AuthPresentationLoggedOut(),
      ],
    );
  });
}

