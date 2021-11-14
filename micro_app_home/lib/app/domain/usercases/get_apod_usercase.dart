import 'package:dartz/dartz.dart';
import 'package:micro_app_home/app/domain/repository/apod_repository.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependency/micro_dependency.dart';

class GetApodUsercase {
  GetApodUsercase(this._repository);
  final ApodRepository _repository;
  Future<Either<RequestError, ApodEntity>>? call() {
    return _repository.getApod();
  }
}
