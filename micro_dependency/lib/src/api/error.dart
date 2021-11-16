import 'package:network/network.dart';

class RequestError extends ApiResult {
  RequestError({
    required this.message,
    this.statusCode,
    this.code,
  });

  final int? statusCode;
  final String message;
  final String? code;

  bool get hasStatusCode => code != null && code!.isNotEmpty;
  bool get errorNoInternet => statusCode == null;

  static RequestError constructError(ApiResult result) {
    if (result is ApiError) {
      return RequestError(
        message: result.error.message ?? '',
        statusCode: result.statusCode,
        code: result.error.code,
      );
    }
    if (result is NoInternet) {
      return RequestError(
        message: "No Internet",
      );
    }

    final InternalError internalError = result as InternalError;
    return RequestError(
      message: internalError.message,
      statusCode: internalError.statusCode,
    );
  }
}
