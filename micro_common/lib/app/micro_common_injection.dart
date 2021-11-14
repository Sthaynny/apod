import 'package:get_it/get_it.dart';
import 'package:micro_common/app/data/repository/local_repository_imp.dart';
import 'package:micro_common/app/domain/repository/local_repository.dart';
import 'package:micro_common/app/domain/usercases/get_local_usercase.dart';
import 'package:micro_common/app/domain/usercases/save_local_usercase.dart';
import 'package:micro_core/app/injenction_container.dart';

class MicroCommonInjection implements IInjectionContainer {
  @override
  void call(GetIt dependency) {
    dependency.registerFactory<LocalRepository>(
      () => LocalRepositoryImp(),
    );
    dependency.registerFactory(
      () => GetLocalUsercase(dependency()),
    );
    dependency.registerFactory(
      () => SaveLocalUsercase(dependency()),
    );
  }
}
