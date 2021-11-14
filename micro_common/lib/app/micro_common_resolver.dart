import 'package:micro_core/app/injenction_container.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_core/app/microapp.dart';

class MicroCommonResolver implements MicroApp {
  @override
  IInjectionContainer get injection => throw UnimplementedError();

  @override
  // TODO: implement microAppName
  String get microAppName => 'micro_common';

  @override
  // TODO: implement routes
  Map<String, WidgetBuilderArgs> get routes => throw UnimplementedError();
}
