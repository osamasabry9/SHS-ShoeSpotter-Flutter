import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoe_spotter/app/di.dart';
import 'package:shoe_spotter/core/utils/constants/text_strings.dart';

import '../../features/Personalization/presentation/pages/address/add_new_address_screen.dart';
import '../../features/Personalization/presentation/pages/address/addresses_screen.dart';
import '../../features/Personalization/presentation/pages/profile/profile_screen.dart';
import '../../features/auth/presentation/pages/email_verification_screen.dart';
import '../../features/auth/presentation/pages/forgot_password_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/reset_password_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/shop/presentation/pages/all_products/all_products_screen.dart';
import '../../features/shop/presentation/pages/brand/all_brands_screen.dart';
import '../../features/shop/presentation/pages/brand/brand_products_screen.dart';
import '../../features/shop/presentation/pages/cart/cart_screen.dart';
import '../../features/shop/presentation/pages/checkout/checkout_screen.dart';
import '../../features/shop/presentation/pages/home/home_screen.dart';
import '../../features/shop/presentation/pages/order/order_screen.dart';
import '../../features/shop/presentation/pages/product_details/product_details.dart';
import '../../features/shop/presentation/pages/product_reviews/product_reviews_screen.dart';
import '../../features/shop/presentation/pages/sub_categories/sub_categories_screen.dart';
import '../utils/models/success_items_model.dart';
import '../widgets/screens/main_screen.dart';
import '../widgets/screens/not_found_page.dart';
import '../widgets/screens/success_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        bool onBoardingScreenViewed = instance<GetStorage>()
                .read(AppTexts.PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
            false;
        return MaterialPageRoute(
          builder: (_) => onBoardingScreenViewed
              ? const LoginScreen()
              : const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.emailVerificationScreen:
        return MaterialPageRoute(
          builder: (context) => const EmailVerificationScreen(),
        );
      case Routes.successScreen:
        if (args is SuccessItemsModel) {
          return MaterialPageRoute(
            builder: (context) => SuccessScreen(
              itemsModel: args,
            ),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => const NotFoundPage(),
          );
        }
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.subCategoriesScreen:
        return MaterialPageRoute(
          builder: (context) => const SubCategoriesScreen(),
        );
      case Routes.allBrandsScreen:
        return MaterialPageRoute(
          builder: (context) => const AllBrandsScreen(),
        );
      case Routes.brandProductsScreen:
        return MaterialPageRoute(
          builder: (context) => const BrandProductsScreen(),
        );
      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailsScreen(),
        );
      case Routes.productReviewsScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductReviewsScreen(),
        );
      case Routes.allProductsScreen:
        return MaterialPageRoute(
          builder: (context) => const AllProductsScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case Routes.checkoutScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckoutScreen(),
        );
      case Routes.orderScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.addressesScreen:
        return MaterialPageRoute(
          builder: (context) => const AddressesScreen(),
        );
      case Routes.addNewAddressScreen:
        return MaterialPageRoute(
          builder: (context) => const AddNewAddressScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
