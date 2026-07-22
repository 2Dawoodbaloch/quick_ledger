

import 'package:get/get.dart';
import 'package:quick_ledger/features/authentication/screens/login/login.dart';
import 'package:quick_ledger/features/authentication/screens/signup/signup.dart';
import 'package:quick_ledger/home.dart';
import 'package:quick_ledger/routes/routes_name.dart';

class AppRouter {
  AppRouter._();

  static final List<GetPage> pages = [
    GetPage(name: RoutesName.login, page: () => const LoginScreen()),
    GetPage(name: RoutesName.home, page: () => const HomeScreen()),
     GetPage(name: RoutesName.signup, page: () => const SignUpScreen()),
  ];
}
