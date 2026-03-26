part of '../bloc/auth_bloc.dart';

abstract class AuthPresentationEvent extends Equatable {
  const AuthPresentationEvent();

  @override
  List<Object?> get props => [];
}

class AuthPresentationLoggedIn extends AuthPresentationEvent {
  const AuthPresentationLoggedIn(this.message);

  final String message;
}

class AuthPresentationLoggedOut extends AuthPresentationEvent {
  const AuthPresentationLoggedOut();
}

class AuthPresentationError extends AuthPresentationEvent {
  const AuthPresentationError({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
