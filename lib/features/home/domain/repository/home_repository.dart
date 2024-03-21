import 'package:fpdart/fpdart.dart';
import 'package:snapbook/core/error/error.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, dynamic>> homeUserLogOut();
}
