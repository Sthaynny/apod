import 'package:meta/meta.dart';
import 'package:micro_app_home/app/domain/usercases/get_apod_usercase.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependency/micro_dependency.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> implements NetworkErrorObservable {
  HomeCubit(this._usercase) : super(HomeInitial()) {
    NetworkErrorObserver.instance.addListener(listener: this);
  }
  final GetApodUsercase _usercase;

  Future getApodDetails() async {
    emit(HomeLoading());
    final result = await _usercase();
    if (result == null) {
      emit(HomeError());
      return;
    }
    result.fold(
      (error) {
        emit(HomeError());
      },
      (apod) {
        emit(HomeLoaded(apod));
      },
    );
  }

  @override
  void onNetworkError(NetworkErrorType errorType) {
    if (errorType == NetworkErrorType.noConnection) {
      emit(HomeError());
    }
  }
}
