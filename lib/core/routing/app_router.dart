import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/models/success_items_model.dart';
import '../../features/auth/presentation/pages/email_verification_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../widgets/not_found_page.dart';
import '../widgets/success_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
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
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
