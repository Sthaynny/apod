import 'package:micro_common/app/micro_common_injection.dart';
import 'package:micro_core/app/injenction_container.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_core/app/microapp.dart';

class MicroCommonResolver implements MicroApp {
  @override
  IInjectionContainer get injection => MicroCommonInjection();

  @override
  String get microAppName => 'micro_common';

  @override
  Map<String, WidgetBuilderArgs> get routes => {};

  @override
  void Function() get createListener => (){};
}
