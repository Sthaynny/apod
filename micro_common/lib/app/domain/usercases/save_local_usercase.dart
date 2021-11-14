import 'package:micro_common/app/domain/entity/apod_entity.dart';
import 'package:micro_common/app/domain/repository/local_repository.dart';

class SaveLocalUsercase {
  SaveLocalUsercase(this._repository);
  final LocalRepository _repository;
  Future<bool?> call(ApodEntity apod) {
    return _repository.saveApodLocal(apod);
  }
}
