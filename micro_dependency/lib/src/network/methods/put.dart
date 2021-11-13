import 'package:micro_dependency/src/network/endpoint/endpoint.dart';
import 'package:micro_dependency/src/network/http/provider/network_provider.dart';
import 'package:micro_dependency/src/network/methods/http_method.dart';
import 'package:micro_dependency/src/network/network.dart';

class Put implements HttpMethod {
  @override
  Future<NetworkResponse> request(
      {required NetworkProvider http, required Endpoint endpoint}) {
    return http.put(endpoint: endpoint);
  }
}
