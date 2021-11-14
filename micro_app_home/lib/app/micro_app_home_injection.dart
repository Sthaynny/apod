import 'package:micro_app_home/app/data/datasource/apod_datasource.dart';
import 'package:micro_core/app/injenction_container.dart';
import 'package:micro_dependency/micro_dependency.dart';

class MicroAppHomeInjection implements IInjectionContainer {
  @override
  void call(GetIt dependency) {
    dependency.registerFactory(
      () => ApodDataSouce(),
    );
  }
}
