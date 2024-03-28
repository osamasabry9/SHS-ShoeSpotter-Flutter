import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();
  late Connectivity _connectivity;
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  late List<ConnectivityResult> _connectionStatus;
  Function(List<ConnectivityResult>)? _connectionChangeCallback;

  factory NetworkManager() {
    return _instance;
  }

  NetworkManager._internal() {
    _connectivity = Connectivity();
    _connectionStatus = [];
    _init();
  }
 void setConnectionChangeCallback(Function(List<ConnectivityResult>) callback) {
    _connectionChangeCallback = callback;
  }
  Future<void> _init() async {
    _connectionStatus = await _connectivity.checkConnectivity();
    _subscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    _connectionStatus = result;
    _connectionChangeCallback?.call(_connectionStatus);
    // if (_connectionStatus.contains(ConnectivityResult.none)) {
    //   AppHelperFunctions.showSnackBar(context: context, message: message)
    //   TLoaders.warningSnackBar(title: 'No Internet Connection');
    // }
    // You can trigger events or handle UI updates based on the connection status change here
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  Future<List<ConnectivityResult>> getConnectionStatus() async {
    _connectionStatus = await _connectivity.checkConnectivity();
    return _connectionStatus;
  }

  void dispose() {
    _subscription.cancel();
  }
}
