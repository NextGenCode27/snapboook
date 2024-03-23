import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/error/error.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, String>> updateBio({required String bio});
}
