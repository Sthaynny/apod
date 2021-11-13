import 'dart:async';

import 'package:dio/dio.dart';
import 'package:micro_dependency/src/network/http/obsevers/network_error_observable/network_error_observable.dart';
import 'package:micro_dependency/src/network/http/obsevers/network_error_observable/network_error_type.dart';

class CheckConnectionInterceptor extends Interceptor {
  CheckConnectionInterceptor({
    required this.dio,
  });

  final Dio dio;

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.error != null) {
      if (err.response?.statusCode == 404) {
        NetworkErrorObserver.instance
            .criarNotificacao(errorType: NetworkErrorType.notfound);
      }
    }

    handler.next(err);
  }

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isConnected = await connectionChecker.isConnected();
    if (!isConnected) {
      NetworkErrorObserver.instance
          .criarNotificacao(errorType: NetworkErrorType.noConnection);
      await connectionChecker.handleRetryWhenInternetBack();
    }
    handler.next(options);
  }
}
