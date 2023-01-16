import 'dart:async';

import 'package:event_bus/event_bus.dart';

class EventBus {
  EventBus._internal();

  static final EventBus _instance = EventBus._internal();
  factory EventBus() => _instance;

  final _bus = StreamController<IEventBus>.broadcast();

  static emit(payload) {
    _instance._bus.sink.add(payload);
  }

  static get listen => _instance._bus.stream.listen;
}
