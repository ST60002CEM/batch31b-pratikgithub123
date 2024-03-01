import 'package:fruit_ordering_app/features/auth/presentation/view/login_view.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view/register_view.dart';

import 'package:fruit_ordering_app/features/home/presentation/view/home_view.dart';
import 'package:fruit_ordering_app/features/products/presentation/view/product_view.dart';
import 'package:fruit_ordering_app/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();

  // static const String dashboardRoute = '/';
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static const String profileRoute = '/profile';

  static const String productRoute = '/product';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      homeRoute: (context) => const HomeView(),
      loginRoute: (context) => const MyLogin(),
      registerRoute: (context) => const MyRegister(),
      productRoute: (context) => ProductView(),
    };
  }
}
