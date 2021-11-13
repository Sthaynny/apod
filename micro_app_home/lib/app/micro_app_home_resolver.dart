import 'package:micro_app_home/app/screens/home_screen.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppHomeResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        Routes.home: (context, args) => const HomeScreen(),
      };
}
