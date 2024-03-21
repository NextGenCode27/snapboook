import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/common/entity/user_enitity.dart';
import 'package:snapbook/core/error/error.dart';
import 'package:snapbook/core/usecase/usecase.dart';
import 'package:snapbook/features/auth/domain/repository/auth_repository.dart';

class LoginUsecase implements Usecase<UserEntity, LoginParams> {
  final AuthRepository authRepository;
  LoginUsecase(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
