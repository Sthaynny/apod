import 'package:dio/dio.dart';
import 'package:micro_dependency/src/network/endpoint/endpoint.dart';
import 'package:micro_dependency/src/network/http/provider/dio/helpers/request_helper.dart';
import 'package:micro_dependency/src/network/http/provider/dio/helpers/response_type_dio_helper.dart';
import 'package:micro_dependency/src/network/network.dart';

class PatchHelper implements RequestHelper {
  final _contentTypeHelper = ContentTypeDioResponse();

  @override
  Future<NetworkResponse> makeRequestHelper({
    required Endpoint endpoint,
    required Dio httpProvider,
  }) async {
    final Response<dynamic> response =
        await httpProvider.patch<dynamic>(endpoint.path,
            queryParameters: endpoint.queryParameters,
            options: Options(
              headers: <String, dynamic>{
                ...httpProvider.options.headers,
                ...endpoint.headers ?? <String, dynamic>{},
              },
              responseType:
                  _contentTypeHelper.getDioResponseType(endpoint.responseType),
            ),
            data: endpoint.parameters);
    return NetworkResponse(
      data: response.data,
      status: response.statusCode,
    );
  }
}
