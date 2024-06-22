import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/constants/api_keys.dart';
import '../../../../../core/utils/constants/enums.dart';

import '../../../../../app/di.dart' as di;

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/models/success_items_model.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../../Personalization/presentation/controllers/address/address_controller.dart';
import '../../../data/models/order_model.dart';
import '../../../data/models/stripe_models/payment_intent_input_model.dart';
import '../../../domain/usecases/get_user_orders_usecase.dart';
import '../../../domain/usecases/save_order_usecase.dart';
import '../cart/cart_controller.dart';
import 'checkout_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;

  /// Methods

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await di.getIt<GetUserOrdersUseCase>().call();
      return userOrders;
    } catch (e) {
      AppLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // add methods for order processing

  Future<void> processOrder(double totalAmount) async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "Processing your order", AppImages.docerAnimation);

      // Get user auth id
      final user = di.getIt<FirebaseAuth>().currentUser;
      final userId = user!.uid;
      if (userId.isEmpty) return;

      // add Details to order
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: totalAmount,
        orderData: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 7),
        items: cartController.cartItems.toList(),
      );

      // save order
      await di.getIt<SaveOrderUseCase>().call(order: order);
      await checkoutController.makePayment(
          paymentIntentInputModel: PaymentIntentInputModel(
              customerId: AppKeys.customerId,
              amount: (totalAmount * 100).toString().split('.')[0],
              currency: 'USD'));

      // Update the cart status
      cartController.clearCart();

      Get.offNamed(
        Routes.successScreen,
        arguments: SuccessItemsModel(
            image: AppImages.orderCompleteAnimation,
            title: "Payment Successful!",
            subtitle: "Your item will be shipped soon!.",
            routeName: Routes.mainScreen),
      );
    } catch (e) {
      AppFullScreenLoader.closeLoadingDialog();
      AppLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
