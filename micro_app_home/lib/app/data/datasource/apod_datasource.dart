import 'package:micro_dependency/micro_dependency.dart';

class ApodDataSouce {
  Future<ApiResult> getApod() async {
    final Endpoint endpoint = Endpoint();
    return await ApiManager.requestApi(endpoint: endpoint);
  }
}
