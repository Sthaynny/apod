import 'package:micro_core/app/injenction_container.dart';

import 'micro_core_utils.dart';

abstract class MicroApp {
  String get microAppName;

  Map<String, WidgetBuilderArgs> get routes;

  IInjectionContainer get injection;
}
