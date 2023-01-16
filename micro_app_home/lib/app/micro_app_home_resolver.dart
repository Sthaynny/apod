import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_home/app/micro_app_home_injection.dart';
import 'package:micro_app_home/app/presentation/home_screen.dart';
import 'package:micro_app_home/app/routes/home_routes.dart';
import 'package:micro_core/app/injenction_container.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppHomeResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        HomeRoutes.init.path: (context, args) => const HomeScreen(),
      };

  @override
  IInjectionContainer get injection => MicroAppHomeInjection();

  @override
  ValueSetter<IEventBus> get myEventsNatigator => (event) {};
}
