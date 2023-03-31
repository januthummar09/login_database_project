import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/common_login_button.dart';
import '../../common_widget/common_textfild.dart';
import '../../utils/db_helper.dart';
import '../../utils/helper.dart';
import '../../utils/text_style_fun.dart';
import '../signup/sign_up_screen.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Helper helper = Helper();
    final controller = Get.put(LoginController());
    DataBaseHelper? dbHelper = DataBaseHelper();

    GlobalKey<FormState> formKey = new GlobalKey<FormState>();

    // final formkey = GlobalKey();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ).copyWith(bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
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
                        "Email",
                        style: textDeco(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextfildWidget(
                        controller: controller.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }

                          return null.toString();
                        },
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
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please enter password';
                        //   } else if (value.length < 6) {
                        //     return 'Enter minimum 6 digit';
                        //   } else {
                        //     return 'success';
                        //   }
                        // },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonLoginButton(onTap: () async {
                        // var emailValid = helper.validEmail(controller.emailController.text);
                        // var passValid = helper.validPassword(controller.passwordController.text);
                        var isExistemail = await dbHelper.checkEmailExist(controller.emailController.text);

                        debugPrint("validdddddd------------------>>$isExistemail");

                        debugPrint("------------>>${formKey.currentState!.validate()}");

                        if (formKey.currentState!.validate()) {
                          // Get.to(
                          //   HomeScreen(
                          //     email: controller.emailController.text,
                          //   ),
                          // );
                          // if (isExistemail == true) {
                          //   Get.to(
                          //     HomeScreen(
                          //       email: controller.emailController.text,
                          //     ),
                          //   );
                          // }
                          debugPrint("success.....");
                        } else {
                          debugPrint("not valid.....");
                        }

                        // if (emailValid == null) {
                        //   if (passValid == null) {
                        //     if (isExistemail == true) {
                        //       // controller.addUser(UserModel(email: controller.emailController.text, password: controller.passwordController.text));
                        //       Get.to(
                        //         HomeScreen(
                        //           email: controller.emailController.text,
                        //         ),
                        //       );
                        //
                        //       final snackBar = SnackBar(
                        //         content: const Text('Account Login successfully....'),
                        //         backgroundColor: (Colors.black12),
                        //         duration: const Duration(seconds: 1),
                        //         action: SnackBarAction(
                        //           label: '',
                        //           onPressed: () {},
                        //         ),
                        //       );
                        //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //
                        //       debugPrint("Account Login successfully....");
                        //     } else {
                        //       debugPrint("your account has not found");
                        //
                        //       showDialog(
                        //         context: context,
                        //         builder: (BuildContext context) {
                        //           return const AlertDialog(
                        //             content: Text("your account has not found"),
                        //           );
                        //         },
                        //       );
                        //     }
                        //   } else {
                        //     debugPrint("password validation error------------------>>$passValid");
                        //
                        //     showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return const AlertDialog(
                        //           content: Text("enter minimum 6 digit"),
                        //         );
                        //       },
                        //     );
                        //   }
                        // } else {
                        // debugPrint("create new account");
                        // debugPrint("email validation error------------------>>$emailValid");

                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return const AlertDialog(
                        //       content: Text("your email is  invalid"),
                        //     );
                        //   },
                        // );
                      }

                          // var emailValid = helper.validEmail(controller.emailController.text);
                          // var passValid = helper.validPassword(controller.passwordController.text);
                          // debugPrint("pass value------------------>>$passValid");
                          // debugPrint("email value----->>$emailValid");
                          // if (emailValid == null) {
                          //   if (passValid == null) {
                          //     Get.to(const HomeScreen());
                          //   } else {
                          //     debugPrint("Aleart------------------>>$passValid");
                          //   }
                          // } else {
                          //   debugPrint("Aleart------------------>>$emailValid");
                          // }
                          // },
                          ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              SignUpScreen(
                                email: controller.emailController.text,
                              ),
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Need an Account?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5c585a),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'SIGN UP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? customValidtaor(String? fieldContent) => fieldContent!.isEmpty ? 'Ce champ est obligatoire.' : null;
}
