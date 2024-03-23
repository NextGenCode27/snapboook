part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {
  @override
  String toString() => 'Profile State';
}

final class ProfileInitial extends ProfileState {
  @override
  String toString() => 'Profile Initial';
}

final class ProfileLoading extends ProfileState {
  @override
  String toString() => 'Profile Loading';
}

final class ProfileSuccess extends ProfileState {
  @override
  String toString() => 'Profile Success';
}

final class ProfileFailed extends ProfileState {
  final String message;
  ProfileFailed({required this.message});
  @override
  String toString() => 'Profile Failed';
}
