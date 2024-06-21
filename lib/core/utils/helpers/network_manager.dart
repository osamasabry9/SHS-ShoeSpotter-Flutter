import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final RxBool _isConnected = false.obs;
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;

  bool get isConnected => _isConnected.value;

  @override
  void onInit() {
    super.onInit();
    _startMonitoring();
  }

  void _startMonitoring() {
    _connectionSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          _isConnected.value = true;
          break;
        case InternetConnectionStatus.disconnected:
          _isConnected.value = false;
          // Handle no internet connection scenario

          AppLoaders.warningSnackBar(title: 'No Internet Connection');
          break;
      }
    });
  }

  Future<bool> checkConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  @override
  void onClose() {
    _connectionSubscription?.cancel();
    super.onClose();
  }
}
