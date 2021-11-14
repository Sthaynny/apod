import 'package:micro_common/app/domain/entity/apod_entity.dart';
import 'package:micro_common/app/domain/repository/local_repository.dart';

class GetLocalUsercase {
  GetLocalUsercase(this._repository);
  final LocalRepository _repository;
  Future<ApodEntity?> call() {
    return _repository.getApodLocal();
  }
}
