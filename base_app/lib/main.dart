import 'package:flutter/material.dart';
import 'package:micro_app_home/app/micro_app_home_resolver.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependency/micro_dependency.dart';

void main() {
  DioCreator.init(
    baseUrl:
        'api.nasa.gov/planetary/apod?api_key=Vn3OSccRqpoFtgzFEW6yTVAzJN7Ey2H7UXFgeyJ0',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  MyApp({Key? key}) : super(key: key) {
    registerRouters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      ];
}
