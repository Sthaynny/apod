import 'package:micro_dependency/src/network/response/api_result.dart';
import 'package:micro_dependency/src/network/response/states/apiError/api_error.dart';
import 'package:micro_dependency/src/network/response/states/internal_error.dart';
import 'package:micro_dependency/src/network/response/states/no_internet.dart';

class Erro extends ApiResult {
  Erro({
    required this.message,
    this.statusCode,
    this.code,
  });

  final int? statusCode;
  final String message;
  final String? code;

  String get descricao => message;
  bool get hasStatusCode => code != null && code!.isNotEmpty;
  bool get errorNoInternet => statusCode == null;

  static Erro construirErro(ApiResult result) {
    if (result is ApiError) {
      return Erro(
        message: result.error.message ?? '',
        statusCode: result.statusCode,
        code: result.error.code,
      );
    }
    if (result is NoInternet) {
      return Erro(
        message: "No Internet",
      );
    }

    final InternalError internalError = result as InternalError;
    return Erro(
      message: internalError.message,
      statusCode: internalError.statusCode,
    );
  }
}
