import 'package:flutter/material.dart';

import 'micro_core_utils.dart';
import 'microapp.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs>? get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRouters() {
    if (baseRoutes?.isNotEmpty ?? false) routes.addAll(baseRoutes!);
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  void registerListener() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.createListener();
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo != null) {
      return MaterialPageRoute(
        builder: (context) => navigateTo.call(context, routerArgs),
      );
    } else {
      return null;
    }
  }
}
