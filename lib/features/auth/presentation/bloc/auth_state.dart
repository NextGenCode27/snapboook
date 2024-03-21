part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  @override
  String toString() => 'Auth State';
}

final class AuthInitial extends AuthState {
  @override
  String toString() => 'Auth Initial';
}

final class AuthLoading extends AuthState {
  @override
  String toString() => 'Auth Loading';
}

final class AuthSuccess extends AuthState {
  final UserEntity userEntity;

  AuthSuccess({required this.userEntity});
  @override
  String toString() => 'Auth Success';
}

final class AuthFailed extends AuthState {
  final String message;

  AuthFailed({required this.message});
  @override
  String toString() => 'Auth Failed';
}
