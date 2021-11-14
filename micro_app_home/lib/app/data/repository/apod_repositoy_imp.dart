import 'package:dartz/dartz.dart';
import 'package:micro_app_home/app/data/datasource/apod_datasource.dart';
import 'package:micro_app_home/app/domain/repository/apod_repository.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependency/micro_dependency.dart';

class ApodRepositoryImp implements ApodRepository {
  ApodRepositoryImp(this._datasource);
  final ApodDataSouce _datasource;
  @override
  Future<Either<RequestError, ApodEntity>> getApod() async {
    final result = await _datasource.getApod();

    if (result is Success) {
      return Right(
        ApodModel.fromJson(result.data),
      );
    }

    return Left(RequestError.constructError(result));
  }
}
