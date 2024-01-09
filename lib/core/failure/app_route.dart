import 'package:fruit_ordering_app/features/auth/presentation/view/login_view.dart';
import 'package:fruit_ordering_app/features/auth/presentation/view/register_view.dart';
import 'package:fruit_ordering_app/features/home/presentation/view/bottom_navigation/dashboard.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String dashboardRoute = '/dashboard';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const (),
      loginRoute: (context) => const MyLogin(),
      dashboardRoute: (context) => const DashboardView(),
      registerRoute: (context) => const MyRegister(),
    };
  }
}
