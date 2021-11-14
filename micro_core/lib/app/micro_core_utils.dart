import 'package:flutter/widgets.dart';
import 'package:micro_dependency/micro_dependency.dart';

typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? args);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
final dependency = GetIt.instance;
