abstract class UserEntity {
  final String id;
  final String userName;
  final String email;
  final String phone;
  final String photoUrl;
  final String photoId;
  final DateTime updatedAt;

  UserEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.photoUrl,
    required this.photoId,
    required this.updatedAt,
  });
}
