import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/common/entity/user_enitity.dart';
import 'package:snapbook/core/error/error.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
    required String phone,
    required String photoUrl,
  });
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> currentUserData();
}
