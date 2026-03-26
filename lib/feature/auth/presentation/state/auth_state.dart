part of '../bloc/auth_bloc.dart';

enum AuthStatus { initial, loading, success, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final User? user;

  const AuthState({this.status = AuthStatus.initial, this.user});

  AuthState copyWith({AuthStatus? status, User? user}) {
    return AuthState(status: status ?? this.status, user: user ?? this.user);
  }

  bool get authenticated => user != null;

  @override
  List<Object?> get props => [status, user];
}
