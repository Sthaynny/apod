import 'package:micro_dependency/src/network/raw_response_notifier/raw_response.dart';

abstract class RawResponseNotifiable {
  void onResponse(RawResponse response);
}
