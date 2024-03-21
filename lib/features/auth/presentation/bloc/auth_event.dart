part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  @override
  String toString() => 'Auth Event';
}

final class AuthRegisterEvent extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  final String phone;
  final String photoUrl;

  AuthRegisterEvent({
    required this.userName,
    required this.email,
    required this.password,
    required this.phone,
    required this.photoUrl,
  });
  @override
  String toString() => 'Auth Register Event';
}

final class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({
    required this.email,
    required this.password,
  });
  @override
  String toString() => 'Auth Login Event';
}

final class AuthUserIsLoggedInEvent extends AuthEvent {
  @override
  String toString() => 'Auth User Logged In Event';
}
