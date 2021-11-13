import 'package:micro_dependency/src/network/mock/mock_strategy.dart';

class BaseStrategy implements MockStrategy {
  const BaseStrategy({String? jsonFile}) : _jsonFile = jsonFile;
  final String? _jsonFile;

  @override
  String? getNameJsonFile() {
    return _jsonFile;
  }
}
