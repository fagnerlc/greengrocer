import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/view/sign_in_screen.dart';
import 'package:greengrocer/src/pages/auth/view/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoutes.splashRoutes,
    ),
    GetPage(
      page: () => SignInScreen(),
      name: PagesRoutes.signInRoutes,
    ),
    GetPage(
      page: () => const SignUpScreen(),
      name: PagesRoutes.signUpRoutes,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PagesRoutes.baseRoutes,
    ),
  ];
}

abstract class PagesRoutes {
  static const String splashRoutes = '/splash';
  static const String signInRoutes = '/signin';
  static const String signUpRoutes = '/signup';
  static const String baseRoutes = '/';
}
