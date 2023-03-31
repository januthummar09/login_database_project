import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_database_project/screens/home_screen/home_screen.dart';
import 'package:login_database_project/screens/splash_screen/splash_binding.dart';
import 'package:login_database_project/screens/splash_screen/splash_screen.dart';
import 'package:login_database_project/utils/routes/routes_name.dart';

import '../../screens/home_screen/home_binding.dart';
import '../../screens/login/login_binding_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/signup/sign_up_binding_screen.dart';
import '../../screens/signup/sign_up_screen.dart';

List<GetPage<dynamic>> routesList = [
  GetPage(name: RoutesName.SplashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
  GetPage(name: RoutesName.loginScreen, page: () => LoginScreen(), binding: LoginBinding()),
  GetPage(name: RoutesName.signUpScreen, page: () => const SignUpScreen(), binding: SignUpBinding()),
  GetPage(name: RoutesName.homeScreen, page: () => const HomeScreen(), binding: HomeBinding()),
];
