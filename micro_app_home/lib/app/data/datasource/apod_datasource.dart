import 'package:micro_dependency/micro_dependency.dart';

class ApodDataSouce {
  Future<ApiResult> getApod({
    required Map<String, dynamic> body,
  }) async {
    final Endpoint endpoint = Endpoint(
      method: Post(),
      path: '',
    );
    return await ApiManager.request(endpoint: endpoint);
  }
}
