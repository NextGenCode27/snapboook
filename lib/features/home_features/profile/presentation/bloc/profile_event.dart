part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {
  @override
  String toString() => 'Profile Event';
}

final class UpdateProfileBioEvent extends ProfileEvent {
  final String bio;
  UpdateProfileBioEvent({required this.bio});
}
