import 'package:micro_app_details/app/presentation/details_screen.dart';
import 'package:micro_common/app/domain/entity/apod_entity.dart';
import 'package:micro_core/app/injenction_container.dart';
import 'package:micro_core/app/micro_core_utils.dart';
import 'package:micro_core/app/microapp.dart';

class MicroAppDetailsResolver implements MicroApp {
  @override
  IInjectionContainer? get injection => null;

  @override
  String get microAppName => 'micro_app_details';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/details': (context, args) => DetailsScreen(apod: args as ApodEntity),
      };
}
