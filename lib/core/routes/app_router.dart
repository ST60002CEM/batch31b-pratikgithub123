import 'package:fruit_ordering_app/features/auth/presentation/view/login_view.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view/register_view.dart';
import 'package:fruit_ordering_app/features/home/presentation/view/bottom_navigation/dashboard.dart';
import 'package:fruit_ordering_app/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/';
  static const String dashboardRoute = '/dashboard';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String myloginRoute = '/mylogin';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      dashboardRoute: (context) => const DashboardView(),
      loginRoute: (context) => const MyLogin(),
      registerRoute: (context) => const MyRegister(),
    };
  }
}
