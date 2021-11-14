import 'package:micro_dependency/src/network/endpoint/endpoint.dart';
import 'package:micro_dependency/src/network/http/provider/network_provider.dart';
import 'package:micro_dependency/src/network/response/network_response.dart';

abstract class HttpMethod {
  Future<NetworkResponse> request(
      {required NetworkProvider http, required Endpoint endpoint});
}
