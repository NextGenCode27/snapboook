import 'package:snapbook/core/common/entity/user_enitity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.userName,
    required super.email,
    required super.phone,
    required super.photoUrl,
    required super.photoId,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      photoId: map['photoId'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'email': email,
        'phone': phone,
        'photoUrl': photoUrl,
        'photoId': photoId,
        'updatedAt': updatedAt,
      };

  UserModel copyWith({
    String? id,
    String? userName,
    String? email,
    String? phone,
    String? photoUrl,
    String? photoId,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      photoId: photoId ?? this.photoId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
