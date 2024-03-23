abstract class UserEntity {
  final String id;
  final String userName;
  final String email;
  final String phone;
  final String photoUrl;
  final String bio;
  final List<String> following;
  final List<String> followers;
  // final String photoId;

  UserEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.photoUrl,
    required this.bio,
    required this.followers,
    required this.following,
    // required this.photoId,
  });
}
