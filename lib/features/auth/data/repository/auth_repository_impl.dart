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
  }) async {
    try {
      final user = await authRemoteDatasource.signUp(
        userName: userName,
        email: email,
        phone: phone,
        password: password,
        photoUrl: photoUrl,
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
}