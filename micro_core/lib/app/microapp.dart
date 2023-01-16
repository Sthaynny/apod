import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/app/injenction_container.dart';

import 'micro_core_utils.dart';

abstract class MicroApp {
  String get microAppName;

  Map<String, WidgetBuilderArgs> get routes;

  IInjectionContainer? get injection;

  ValueSetter<IEventBus> get myEventsNatigator;
}

extension MicroAppExt on MicroApp {
  ValueGetter<StreamSubscription<IEventBus>> get createListenerNavigation =>
      EventBus.listen(myEventsNatigator);
}
