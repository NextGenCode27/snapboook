import 'package:snapbook/core/common/entity/user_enitity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.userName,
    required super.email,
    required super.phone,
    required super.photoUrl,
    required super.bio,
    required super.followers,
    required super.following,
    // required super.photoId,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'] ?? '',
        userName: map['name'] ?? '',
        email: map['email'] ?? '',
        phone: map['phone'] ?? '',
        photoUrl: map['photo_url'] ?? '',
        bio: map['bio'] ?? '',
        followers: map['followers'] ?? [],
        following: map['following'] ?? []
        // photoId: map['photo_id'] ?? '',
        );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': userName,
        'email': email,
        'phone': phone,
        'photo_url': photoUrl,
        'bio': bio,
        'followers': followers,
        'following': following,
        // 'photo_id': photoId,
      };

  UserModel copyWith({
    String? id,
    String? userName,
    String? email,
    String? phone,
    String? photoUrl,
    String? bio,
    List<String>? followers,
    List<String>? following,
    // String? photoId,
    // DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      // photoId: photoId ?? this.photoId,
    );
  }
}
