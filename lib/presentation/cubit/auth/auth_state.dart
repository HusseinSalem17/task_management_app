part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthSuccess extends AuthState {
  final AuthEntity authEntity;

  const AuthSuccess(this.authEntity);

  @override
  List<Object> get props => [authEntity];
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class AuthLocalDeleteSuccess extends AuthState {
  const AuthLocalDeleteSuccess();
}

final class AuthLocalDeleteFailure extends AuthState {
  final String message;

  const AuthLocalDeleteFailure(this.message);

  @override
  List<Object> get props => [message];
}
