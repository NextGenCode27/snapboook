import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/common/entity/user_enitity.dart';
import 'package:snapbook/core/error/error.dart';
import 'package:snapbook/core/error/exception.dart';
import 'package:snapbook/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:snapbook/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl(this.authRemoteDatasource);
  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
    required String phone,
    required String photoUrl,
    required String bio,
    // required List<String> followers,
    // required List<String> following,
  }) async {
    try {
      final user = await authRemoteDatasource.signUp(
        userName: userName,
        email: email,
        phone: phone,
        password: password,
        photoUrl: photoUrl,
        bio: bio,
      );
      return right(user);
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDatasource.signIn(
        email: email,
        password: password,
      );
      return right(user);
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> currentUserData() async {
    try {
      final user = await authRemoteDatasource.getCurrentUserData();
      if (user == null) {
        return left(Failure(
            message:
                'User not logged in or current user data not found, please try to login again'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
