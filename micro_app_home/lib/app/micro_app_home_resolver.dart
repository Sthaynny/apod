import 'package:micro_core/app/micro_app.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_core/micro_core.dart';

import 'coordinator/home_navigator.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get navigator => {
        AppRoutes.home: (context, args) => const HomeNavigator(),
      };
}
