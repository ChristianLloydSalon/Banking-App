part of '../bloc/auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoggedIn extends AuthEvent {
  final String username;
  final String password;

  const AuthLoggedIn({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class AuthLoggedOut extends AuthEvent {
  const AuthLoggedOut();
}
