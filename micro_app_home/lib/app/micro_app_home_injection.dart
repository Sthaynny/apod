import 'package:micro_app_home/app/data/datasource/apod_datasource.dart';
import 'package:micro_app_home/app/data/repository/apod_repositoy_imp.dart';
import 'package:micro_app_home/app/domain/repository/apod_repository.dart';
import 'package:micro_app_home/app/domain/usercases/get_apod_usercase.dart';
import 'package:micro_app_home/app/presentation/cubit/home_cubit.dart';
import 'package:micro_core/app/injenction_container.dart';
import 'package:micro_dependency/micro_dependency.dart';

class MicroAppHomeInjection implements IInjectionContainer {
  @override
  void call(GetIt dependency) {
    dependency.registerFactory(
      () => ApodDataSouce(),
    );
    dependency.registerFactory<ApodRepository>(
      () => ApodRepositoryImp(dependency()),
    );
    dependency.registerFactory(
      () => GetApodUsercase(dependency()),
    );
    dependency.registerFactory(
      () => HomeCubit(
        getApodUsercase: dependency(),
        saveLocalUsercase: dependency(),
        getLocalUsercase: dependency(),
      ),
    );
  }
}
