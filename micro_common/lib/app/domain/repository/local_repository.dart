import 'package:micro_common/app/domain/entity/apod_entity.dart';

abstract class LocalRepository {
  Future<ApodEntity?> getApodLocal();
  Future<bool> saveApodLocal(ApodEntity apod);
}
