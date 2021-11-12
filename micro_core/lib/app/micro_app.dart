import 'package:micro_dependency/micro_dependency.dart';

abstract class MicroApp {
  String get microAppName;
  List<NuRouter> get routes;
}
