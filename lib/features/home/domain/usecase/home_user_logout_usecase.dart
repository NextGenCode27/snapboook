import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/error/error.dart';
import 'package:snapbook/core/usecase/usecase.dart';
import 'package:snapbook/features/home/domain/repository/home_repository.dart';

class HomeUserLogoutUsecase implements Usecase<dynamic, NoParams> {
  final HomeRepository homeRepository;
  HomeUserLogoutUsecase(this.homeRepository);
  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    return await homeRepository.homeUserLogOut();
  }
}
