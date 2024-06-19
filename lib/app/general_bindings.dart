import 'package:get/get.dart';

import '../core/utils/helpers/network_manager.dart';
import '../features/shop/presentation/controllers/product/variation_controller.dart';

class GeneralBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());

    Get.put(VariationController());

  }
}