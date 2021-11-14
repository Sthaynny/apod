import 'package:meta/meta.dart';
import 'package:micro_dependency/micro_dependency.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}
