part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {
  @override
  String toString() => 'App User Initial';
}

final class AppUserLoggedIn extends AppUserState {
  final UserEntity userEntity;
  AppUserLoggedIn({required this.userEntity});

  @override
  String toString() => 'App User Logged In';
}
