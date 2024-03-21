import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/error/error.dart';
import 'package:snapbook/core/error/exception.dart';
import 'package:snapbook/features/home/data/data_source/remote/home_remote_datasource.dart';
import 'package:snapbook/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  HomeRepositoryImpl(this.homeRemoteDatasource);
  @override
  Future<Either<Failure, dynamic>> homeUserLogOut() async {
    try {
      final logOutUser = await homeRemoteDatasource.currentUserLogOut();
      return right(logOutUser);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
