import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/error/error.dart';
import 'package:snapbook/core/error/exception.dart';
import 'package:snapbook/features/home_features/profile/data/data_source/remote/profile_remote_datasource.dart';
import 'package:snapbook/features/home_features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl(this.profileRemoteDataSource);
  @override
  Future<Either<Failure, String>> updateBio({required String bio}) async {
    try {
      final bioData = await profileRemoteDataSource.updateBio(bio: bio);
      return right(bioData);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
