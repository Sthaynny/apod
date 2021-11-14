import 'package:micro_core/micro_core.dart';

Future<void> init(List<MicroApp> microApps) async {
  for (var app in microApps) {
    app.injection.call(dependency);
  }
}
