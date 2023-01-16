import 'package:flutter/material.dart';
import 'package:micro_dependency/micro_dependency.dart';

typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? args);
final GlobalKey<NavigatorState> navigationKey =
    GlobalKey<NavigatorState>();
final dependency = GetIt.instance;
