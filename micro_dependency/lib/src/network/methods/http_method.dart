import 'package:banese_digital/dependencias/network/endpoint/endpoint.dart';
import 'package:banese_digital/dependencias/network/http/provider/network_provider.dart';
import 'package:banese_digital/dependencias/network/response/network_response.dart';
import 'package:meta/meta.dart';

abstract class HttpMethod {
  Future<NetworkResponse> request(
      {@required NetworkProvider http, @required Endpoint endpoint});
}
