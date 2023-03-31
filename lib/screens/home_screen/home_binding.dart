import 'package:get/get.dart';
import 'package:login_database_project/screens/home_screen/home_screen.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeScreen>(const HomeScreen());
  }
}
