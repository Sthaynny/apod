import 'package:micro_common/app/data/models/apod_model.dart';
import 'package:micro_common/app/domain/entity/apod_entity.dart';
import 'package:micro_common/app/domain/repository/local_repository.dart';
import 'package:micro_dependency/micro_dependency.dart';

class LocalRepositoryImp implements LocalRepository {
  Future<ApodEntity?> getApodLocal() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    final result = instance.getString('apod');
    if (result == null) {
      return null;
    }
    return ApodModel.fromJson(result);
  }

  Future<bool> saveApodLocal(ApodEntity apod) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.setString('apod', (apod as ApodModel).toJson());
  }
}
