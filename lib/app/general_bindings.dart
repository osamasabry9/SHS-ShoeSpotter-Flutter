import 'package:get/get.dart';

import '../core/utils/helpers/network_manager.dart';
import '../features/Personalization/presentation/controllers/address/address_controller.dart';
import '../features/shop/presentation/controllers/checkout/checkout_controller.dart';
import '../features/shop/presentation/controllers/product/variation_controller.dart';

class GeneralBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());

    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}
