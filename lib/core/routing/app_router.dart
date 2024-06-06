import 'package:flutter/material.dart';

import '../../features/Personalization/presentation/pages/address/add_new_address_screen.dart';
import '../../features/Personalization/presentation/pages/address/addresses_screen.dart';
import '../../features/Personalization/presentation/pages/profile/change_name_screen.dart';
import '../../features/Personalization/presentation/pages/profile/profile_screen.dart';
import '../../features/Personalization/presentation/pages/profile/re_auth_login_form_screen.dart';
import '../../features/auth/presentation/pages/email_verification_screen.dart';
import '../../features/auth/presentation/pages/forget_password_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/reset_password_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/shop/domain/entities/brand_entity.dart';
import '../../features/shop/domain/entities/product_entity.dart';
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
import '../widgets/screens/loader_screen.dart';
import '../widgets/screens/main_screen.dart';
import '../widgets/screens/not_found_page.dart';
import '../widgets/screens/success_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case Routes.loaderScreen:
        return MaterialPageRoute(
          builder: (_) => const LoaderScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
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
          builder: (context) => args is String
              ? EmailVerificationScreen(email: args)
              : const EmailVerificationScreen(),
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
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => args is String
              ? ResetPasswordScreen(email: args)
              : const NotFoundPage(),
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
          builder: (context) => args is BrandEntity
              ? BrandProductsScreen(brand: args)
              : const NotFoundPage(),
        );
      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => args is ProductEntity ? ProductDetailsScreen(product : args) : const NotFoundPage(),
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
      case Routes.changeNameScreen:
        return MaterialPageRoute(
          builder: (context) => const ChangeNameScreen(),
        );
      case Routes.reAuthLoginFormScreen:
        return MaterialPageRoute(
          builder: (context) => const ReAuthLoginFormScreen(),
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
