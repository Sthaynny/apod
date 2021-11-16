import 'package:micro_core/micro_core.dart';

void init(List<MicroApp> microApps) {
  for (var app in microApps) {
    app.injection?.call(dependency);
  }
}
