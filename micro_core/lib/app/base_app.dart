import 'package:micro_core/app/micro_app.dart';
import 'package:micro_dependency/micro_dependency.dart';

abstract class BaseApp {
  List<MicroApp>? get microApps;

  final List<NuRouter> routes = [];

  void registerRouters() {
    if (microApps != null) {
      for (MicroApp microApp in microApps!) {
        routes.addAll(microApp.routes);
      }
    }
  }
}
