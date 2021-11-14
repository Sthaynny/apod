import 'package:dio/dio.dart';
import 'package:micro_dependency/src/network/endpoint/endpoint.dart';
import 'package:micro_dependency/src/network/http/provider/dio/helpers/request_helper.dart';
import 'package:micro_dependency/src/network/http/provider/dio/helpers/response_type_dio_helper.dart';
import 'package:micro_dependency/src/network/network.dart';

class DeleteHelper implements RequestHelper {
  final _contentTypeHelper = ContentTypeDioResponse();

  @override
  Future<NetworkResponse> makeRequestHelper(
      {required Endpoint endpoint, required Dio httpProvider}) async {
    final Response<dynamic> response = await httpProvider.delete<dynamic>(
      endpoint.path,
      data: endpoint.parameters,
      queryParameters: endpoint.queryParameters,
      options: Options(
        headers: <String, dynamic>{
          ...httpProvider.options.headers,
          ...endpoint.headers ?? {},
        },
        responseType:
            _contentTypeHelper.getDioResponseType(endpoint.responseType),
      ),
    );
    return NetworkResponse(
      data: response.data,
      status: response.statusCode,
    );
  }
}
