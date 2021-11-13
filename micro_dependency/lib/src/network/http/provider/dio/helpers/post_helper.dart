import 'dart:io';

import 'package:dio/dio.dart';
import 'package:micro_dependency/src/network/endpoint/endpoint.dart';
import 'package:micro_dependency/src/network/http/provider/dio/helpers/request_helper.dart';
import 'package:micro_dependency/src/network/http/provider/dio/helpers/response_type_dio_helper.dart';
import 'package:micro_dependency/src/network/network.dart';

class PostHelper implements RequestHelper {
  final _contentTypeHelper = ContentTypeDioResponse();

  @override
  Future<NetworkResponse> makeRequestHelper(
      {required Endpoint endpoint, required Dio httpProvider}) async {
    final Response<dynamic> response = await httpProvider.post<dynamic>(
        endpoint.path,
        options: Options(
            headers: <String, dynamic>{
              ...httpProvider.options.headers,
              ...endpoint.headers,
            },
            contentType: _contentTypeUrlencoded(endpoint.headers)
                ? Headers.formUrlEncodedContentType
                : Headers.jsonContentType,
            responseType:
                _contentTypeHelper.getDioResponseType(endpoint.responseType)),
        queryParameters: endpoint.queryParameters,
        data: endpoint.parameters);
    return NetworkResponse(
      data: response.data,
      status: response.statusCode,
    );
  }

  bool _contentTypeUrlencoded(Map<String, dynamic>? headers) {
    return headers != null &&
        headers.containsKey(HttpHeaders.contentTypeHeader) &&
        headers[HttpHeaders.contentTypeHeader] ==
            Headers.formUrlEncodedContentType;
  }
}
