import 'package:base_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:micro_app_details/app/micro_app_details_resolver.dart';
import 'package:micro_app_home/app/micro_app_home_resolver.dart';
import 'package:micro_common/app/micro_common_resolver.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependency/micro_dependency.dart';

void main() {
  DioCreator.init(
    baseUrl: 'https://api.nasa.gov/planetary/apod',
    queryParameters: <String, dynamic>{
      'api_key': 'Vn3OSccRqpoFtgzFEW6yTVAzJN7Ey2H7UXFgeyJ0',
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  MyApp({Key? key}) : super(key: key) {
    registerRouters();
    registerListener();
    init(microApps);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astronomy Picture of the Day',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.black87,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: Routes.home,
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppHomeResolver(),
        MicroAppDetailsResolver(),
        MicroCommonResolver(),
      ];
}
