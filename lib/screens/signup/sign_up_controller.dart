import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../../utils/db_helper.dart';
import '../../utils/helper.dart';
import '../home_screen/home_screen.dart';
import '../login/login_controller.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final conformPasswordController = TextEditingController();

  Helper helper = Helper();
  DataBaseHelper? dbHelper = DataBaseHelper();

  final loginController = Get.find<LoginController>();

  validationFun() async {
    var firstvalid = helper.firstNameValidation(firstNameController.text);
    var lastValid = helper.lastNameValidation(lastNameController.text);
    var ageValid = helper.ageValidation(ageController.text);
    var genderValid = helper.genderValidation(genderController.text);
    var emailValid = helper.validEmail(emailController.text);
    var passValid = helper.validPassword(passwordController.text);
    var conformPass = helper.conformPassValidation(conformPasswordController.text);
    var isExistemail = await dbHelper!.checkEmailExist(emailController.text);

    debugPrint("pass value------------------>>$passValid");
    debugPrint("email value----->>$emailValid");
    debugPrint("validdddddd------------------>>$isExistemail");

    if (firstvalid == null) {
      if (lastValid == null) {
        if (ageValid == null) {
          if (genderValid == null) {
            if (emailValid == null) {
              if (passValid == null) {
                if (conformPass == null) {
                  if (passwordController.text == conformPasswordController.text) {
                    if (isExistemail == false) {
                      loginController.addUser(
                        UserModel(firstName: firstNameController.text, lastName: lastNameController.text, age: int.parse(ageController.text), gender: genderController.text, email: emailController.text, password: passwordController.text, conformPassword: conformPasswordController.text),
                      );

                      debugPrint("your Account is created");

                      Get.defaultDialog(
                        title: "Aleart DialogBox",
                        middleText: "your Account is created",
                        backgroundColor: const Color(0xFFf558a1),
                        titleStyle: const TextStyle(color: Colors.white),
                        middleTextStyle: const TextStyle(color: Colors.white),
                        radius: 30,
                      );
                      Get.to(
                        HomeScreen(
                          email: emailController.text,
                        ),
                      );

                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return const AlertDialog(
                      //       content: Text("your email is  invalid"),
                      //     );
                      //   },
                      // );

                    } else {}
                  } else {
                    debugPrint("conformPassword validation error------------------>>$conformPass");

                    Get.defaultDialog(
                      title: "Aleart DialogBox",
                      middleText: "Passwords are not same",
                      backgroundColor: const Color(0xFFf558a1),
                      titleStyle: const TextStyle(color: Colors.white),
                      middleTextStyle: const TextStyle(color: Colors.white),
                      radius: 30,
                    );
                  }
                } else {
                  debugPrint("conformPassword validation error------------------>>$conformPass");

                  Get.defaultDialog(
                    title: "Aleart DialogBox",
                    middleText: "enter minimum 6 digit",
                    backgroundColor: const Color(0xFFf558a1),
                    titleStyle: const TextStyle(color: Colors.white),
                    middleTextStyle: const TextStyle(color: Colors.white),
                    radius: 30,
                  );
                }
              } else {
                debugPrint("pass validation error------------------>>$passValid");

                Get.defaultDialog(
                  title: "Aleart DialogBox",
                  middleText: "enter minimum 6 digit",
                  backgroundColor: const Color(0xFFf558a1),
                  titleStyle: const TextStyle(color: Colors.white),
                  middleTextStyle: const TextStyle(color: Colors.white),
                  radius: 30,
                );
              }
            } else {
              debugPrint(" email validation error------------------>>$passValid");

              Get.defaultDialog(
                title: "Aleart DialogBox",
                middleText: "your email is  invalid",
                backgroundColor: const Color(0xFFf558a1),
                titleStyle: const TextStyle(color: Colors.white),
                middleTextStyle: const TextStyle(color: Colors.white),
                radius: 30,
              );
            }
          } else {
            debugPrint(" gender validation error------------------>>$genderValid");

            Get.defaultDialog(
              title: "Aleart DialogBox",
              middleText: "your gender is  empty",
              backgroundColor: const Color(0xFFf558a1),
              titleStyle: const TextStyle(color: Colors.white),
              middleTextStyle: const TextStyle(color: Colors.white),
              radius: 30,
            );
          }
        } else {
          debugPrint(" age validation error------------------>>$ageValid");

          Get.defaultDialog(
            title: "Aleart DialogBox",
            middleText: "your age is  empty",
            backgroundColor: const Color(0xFFf558a1),
            titleStyle: const TextStyle(color: Colors.white),
            middleTextStyle: const TextStyle(color: Colors.white),
            radius: 30,
          );
        }
      } else {
        debugPrint("Last Name validation error------------------>>$lastValid");

        Get.defaultDialog(
          title: "Aleart DialogBox",
          middleText: "your Last Name is  empty",
          backgroundColor: const Color(0xFFf558a1),
          titleStyle: const TextStyle(color: Colors.white),
          middleTextStyle: const TextStyle(color: Colors.white),
          radius: 30,
        );
      }
    } else {
      debugPrint("firstName validation error------------------>>$firstvalid");

      Get.defaultDialog(
        title: "Aleart DialogBox",
        middleText: "your first Name is  empty",
        backgroundColor: const Color(0xFFf558a1),
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
        radius: 30,
      );
    }

    // if (emailValid == null) {
    //   if (passValid == null) {
    //     if (isExistemail == false) {
    //       loginController.addUser(
    //         UserModel(firstName: firstNameController.text, lastName: lastNameController.text, age: int.parse(ageController.text), gender: genderController.text, email: emailController.text, password: passwordController.text, conformPassword: conformPasswordController.text),
    //       );
    //
    //       debugPrint("your Account is created");
    //
    //       Get.defaultDialog(
    //         title: "Aleart DialogBox",
    //         middleText: "your Account is created",
    //         backgroundColor: const Color(0xFFf558a1),
    //         titleStyle: const TextStyle(color: Colors.white),
    //         middleTextStyle: const TextStyle(color: Colors.white),
    //         radius: 30,
    //       );
    //       Get.to(
    //         HomeScreen(
    //           email: emailController.text,
    //         ),
    //       );
    //     }
    //   } else {
    //     debugPrint("password validation error------------------>>$emailValid");
    //
    //     Get.defaultDialog(
    //       title: "Aleart DialogBox",
    //       middleText: "enter minimum 6 digit",
    //       backgroundColor: const Color(0xFFf558a1),
    //       titleStyle: const TextStyle(color: Colors.white),
    //       middleTextStyle: const TextStyle(color: Colors.white),
    //       radius: 30,
    //     );
    //   }
    // } else {
    //   debugPrint("email validation error------------------>>$emailValid");
    //
    //   Get.defaultDialog(
    //     title: "Aleart DialogBox",
    //     middleText: "your email is  invalid",
    //     backgroundColor: const Color(0xFFf558a1),
    //     titleStyle: const TextStyle(color: Colors.white),
    //     middleTextStyle: const TextStyle(color: Colors.white),
    //     radius: 30,
    //   );
    //
    //   // showDialog(
    //   //   context: context,
    //   //   builder: (BuildContext context) {
    //   //     return const AlertDialog(
    //   //       content: Text("your email is  invalid"),
    //   //     );
    //   //   },
    //   // );
    // }
  }
}
