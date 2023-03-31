import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_database_project/screens/login/login_controller.dart';
import 'package:login_database_project/screens/signup/sign_up_controller.dart';

import '../../common_widget/common_login_button.dart';
import '../../common_widget/common_textfild.dart';
import '../../utils/db_helper.dart';
import '../../utils/helper.dart';
import '../../utils/text_style_fun.dart';

class SignUpScreen extends StatelessWidget {
  final String? email;
  const SignUpScreen({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    Helper helper = Helper();
    DataBaseHelper? dbHelper = DataBaseHelper();

    final loginController = Get.find<LoginController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ).copyWith(bottom: 0),
          child: ListView(
            children: [
              Text(
                "Sign Up",
                style: textDeco(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: textDeco(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfildWidget(
                      controller: controller.firstNameController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Last Name",
                      style: textDeco(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfildWidget(
                      controller: controller.lastNameController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Age",
                      style: textDeco(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfildWidget(
                      controller: controller.ageController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Gender",
                      style: textDeco(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfildWidget(
                      controller: controller.genderController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Email",
                      style: textDeco(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfildWidget(
                      controller: controller.emailController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Password",
                      style: textDeco(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfildWidget(
                      controller: controller.passwordController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Conform Password",
                      style: textDeco(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfildWidget(
                      controller: controller.conformPasswordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonLoginButton(
                      onTap: () {
                        controller.validationFun();
                      },
                      buttonName: "Sign Up",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Already login?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5c585a),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///signup  button event
// var emailValid = helper.validEmail(controller.emailController.text);
// var passValid = helper.validPassword(controller.passwordController.text);
// var isExistemail = await dbHelper.checkEmailExist(controller.emailController.text);
//
// debugPrint("pass value------------------>>$passValid");
// debugPrint("email value----->>$emailValid");
// debugPrint("validdddddd------------------>>$isExistemail");
//
// if (emailValid == null) {
// if (passValid == null) {
// if (isExistemail == false) {
// loginController.addUser(
// UserModel(firstName: controller.firstNameController.text, lastName: controller.lastNameController.text, age: int.parse(controller.ageController.text), gender: controller.genderController.text, email: controller.emailController.text, password: controller.passwordController.text, conformPassword: controller.conformPasswordController.text),
// );
//
// debugPrint("your Account is created");
//
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return const AlertDialog(
// content: Text("your Account is created"),
// );
// },
// );
// Get.to(
// HomeScreen(
// email: controller.emailController.text,
// ),
// );
// }
// } else {
// debugPrint("password validation error------------------>>$emailValid");
//
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return const AlertDialog(
// content: Text("enter minimum 6 digit"),
// );
// },
// );
// }
// } else {
// debugPrint("email validation error------------------>>$emailValid");
//
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return const AlertDialog(
// content: Text("your email is  invalid"),
// );
// },
// );
// }
