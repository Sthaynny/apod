import 'package:micro_app_home/app/domain/entity/apod_entity.dart';
import 'package:micro_dependency/micro_dependency.dart';

abstract class ApodRepository {
  Future<Either<Erro, ApodEntity>> getApod();
}
