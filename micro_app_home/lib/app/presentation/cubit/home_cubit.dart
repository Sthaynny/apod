import 'package:meta/meta.dart';
import 'package:micro_app_home/app/domain/usercases/get_apod_usercase.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependency/micro_dependency.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> implements NetworkErrorObservable {
  HomeCubit({
    required GetApodUsercase getApodUsercase,
    required SaveLocalUsercase saveLocalUsercase,
    required GetLocalUsercase getLocalUsercase,
  })  : _getApodUsercase = getApodUsercase,
        _saveLocalUsercase = saveLocalUsercase,
        _getLocalUsercase = getLocalUsercase,
        super(HomeInitial()) {
    NetworkErrorObserver.instance.addListener(listener: this);
  }
  final GetApodUsercase _getApodUsercase;
  final SaveLocalUsercase _saveLocalUsercase;
  final GetLocalUsercase _getLocalUsercase;

  Future getApodDetails() async {
    emit(HomeLoading());
    final result = await _getApodUsercase();
    if (result == null) {
      emit(HomeError());
      return;
    }
    result.fold(
      (error) {
        emit(HomeError());
      },
      (apod) async {
        await _saveLocalUsercase(apod);
        emit(HomeLoaded(apod));
      },
    );
  }

  Future<void> getLocalApod() async {
    emit(HomeLoading());
    final result = await _getLocalUsercase();
    if (result == null) {
      emit(HomeError());
      return;
    }
    emit(HomeLoaded(result));
  }

  @override
  void onNetworkError(NetworkErrorType errorType) {
    if (errorType == NetworkErrorType.noConnection) {
      emit(HomeError());
    }
  }
}
