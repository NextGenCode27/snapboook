import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/common/entity/user_enitity.dart';
import 'package:snapbook/core/error/error.dart';
import 'package:snapbook/core/usecase/usecase.dart';
import 'package:snapbook/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecase implements Usecase<UserEntity, RegisterParams> {
  final AuthRepository authRepository;
  RegisterUsecase(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    return await authRepository.registerWithEmailAndPassword(
      userName: params.userName,
      email: params.email,
      password: params.password,
      phone: params.phone,
      photoUrl: params.photoUrl,
      bio: params.bio,
    );
  }
}

class RegisterParams {
  final String userName;
  final String email;
  final String password;
  final String phone;
  final String photoUrl;
  final String bio;

  RegisterParams({
    required this.userName,
    required this.email,
    required this.password,
    required this.phone,
    required this.photoUrl,
    required this.bio,
    // required this.followers,
    // required this.following,
  });
}
