import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/error/error.dart';
import 'package:snapbook/core/usecase/usecase.dart';
import 'package:snapbook/features/home_features/profile/domain/repository/profile_repository.dart';

class UploadBioUsecase implements Usecase<String, UploadBioParams> {
  final ProfileRepository profileRepository;
  UploadBioUsecase(this.profileRepository);

  @override
  Future<Either<Failure, String>> call(UploadBioParams params) async {
    return await profileRepository.updateBio(bio: params.bio);
  }
}

class UploadBioParams {
  final String bio;
  UploadBioParams({required this.bio});
}
