import 'package:micro_dependency/micro_dependency.dart';

class ApodDataSouce {
  Future<ApiResult> getApod() async {
    final Endpoint endpoint = Endpoint(
      method: Get(),
      path: '',
    );
    return await ApiManager.request(endpoint: endpoint);
  }
}
