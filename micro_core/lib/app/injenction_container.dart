import 'package:micro_dependency/micro_dependency.dart';

abstract class IInjectionContainer {
  void call(GetIt dependency);
}
