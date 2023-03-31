import 'package:get/get.dart';
import 'package:login_database_project/screens/splash_screen/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SplashController>(SplashController());
  }
}
