import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_details/app/presentation/details_screen.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_core/app/injenction_container.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_core/app/microapp.dart';
import 'package:micro_core/app/router/routes_app.dart';

class MicroAppDetailsResolver implements MicroApp {
  @override
  IInjectionContainer? get injection => null;

  @override
  String get microAppName => 'micro_app_details';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        Routes.details: (context, args) =>
            DetailsScreen(apod: args as EventDatails),
      };

  @override
  ValueGetter<StreamSubscription<IEventBus>> get createListenerNavigation =>
      EventBus.listen(
        (event) {
          if (event is EventDatails) {
            navigationKey.currentState?.pushNamed(
              Routes.details,
              arguments: event,
            );
          }
        },
      );
}
