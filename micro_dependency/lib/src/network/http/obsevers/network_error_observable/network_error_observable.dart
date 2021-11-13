import 'dart:async';

import 'package:micro_dependency/src/network/http/obsevers/network_error_observable/network_error_type.dart';

abstract class NetworkErrorObservable {
  void onNetworkError(NetworkErrorType errorType);
}

class NetworkErrorObserver {
  NetworkErrorObserver._internal() {
    _inicializarStream();
  }

  static final NetworkErrorObserver instance = NetworkErrorObserver._internal();

  final StreamController<NetworkErrorType> _networkStream =
      StreamController<NetworkErrorType>.broadcast();

  final List<NetworkErrorObservable> _listeners = [];

  void adicionarListener({required NetworkErrorObservable listener}) {
    if (_listeners.contains(listener)) {
      return;
    }

    _listeners.add(listener);
  }

  void removerListener({required NetworkErrorObservable listener}) {
    if (_listeners.contains(listener)) {
      _listeners.remove(listener);
    }
  }

  void removerListeners() {
    _listeners.clear();
  }

  void criarNotificacao({NetworkErrorType? errorType}) {
    if (errorType == null || _networkStream.isClosed) {
      return;
    }
    _networkStream.add(errorType);
  }

  void _inicializarStream() {
    _networkStream.stream.listen((final NetworkErrorType errorType) {
      for (final NetworkErrorObservable listener in _listeners) {
        listener.onNetworkError(errorType);
      }
    });
  }

  void dispose() {
    _networkStream.close();
    removerListeners();
  }
}
