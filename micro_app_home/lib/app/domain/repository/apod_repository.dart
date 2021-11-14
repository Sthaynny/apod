import 'package:dartz/dartz.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependency/micro_dependency.dart';

abstract class ApodRepository {
  Future<Either<RequestError, ApodEntity>> getApod();
}
