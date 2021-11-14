import 'package:meta/meta.dart';
import 'package:micro_app_home/app/domain/usercases/get_apod_usercase.dart';
import 'package:micro_dependency/micro_dependency.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._usercase) : super(HomeInitial());
  final GetApodUsercase _usercase;
}
