import 'package:get/get.dart';
import 'package:login_database_project/screens/login/login_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    Future.delayed(const Duration(seconds: 1), () {
      return Get.to(() => LoginScreen());
    });
  }

  // @override
  // void onReady() { // called after the widget is rendered on screen
  //   showIntroDialog();
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() { // called just before the Controller is deleted from memory
  //   closeStream();
  //   super.onClose();
  // }
}
