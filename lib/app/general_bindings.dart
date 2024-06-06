import 'package:get/get.dart';

import '../core/utils/helpers/network_manager.dart';

class GeneralBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());

  }
}