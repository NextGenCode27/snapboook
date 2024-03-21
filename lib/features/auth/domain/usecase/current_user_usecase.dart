import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/common/entity/user_enitity.dart';
import 'package:snapbook/core/error/error.dart';
import 'package:snapbook/core/usecase/usecase.dart';
import 'package:snapbook/features/auth/domain/repository/auth_repository.dart';

class CurrentUserUsecase implements Usecase<UserEntity, NoParams> {
  final AuthRepository authRepository;
  CurrentUserUsecase(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await authRepository.currentUserData();
  }
}
