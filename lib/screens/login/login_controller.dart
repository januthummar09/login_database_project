import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_database_project/model/user_model.dart';

import '../../utils/db_helper.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  DataBaseHelper? dbHelper;
  bool isEditing = false;
  UserModel? _user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dbHelper = DataBaseHelper();
    dbHelper!.initDB().whenComplete(() async {});
  }

  Future<void> addOrEditUser() async {
    String email = emailController.text;
    String pass = passwordController.text;

    if (!isEditing) {
      UserModel userr = UserModel(password: pass, email: email);
      await addUser(userr);
    } else {
      _user!.email = email;
      _user!.password = pass;

      await updateUser(_user!);
    }
    resetData();
  }

  Future<void> addUser(UserModel user) async {
    return await dbHelper!.insertUser(user);
    debugPrint("user------>>$user");
  }

  Future<int> updateUser(UserModel user) async {
    return await dbHelper!.updateUser(user);
  }

  void resetData() {
    emailController.clear();
    passwordController.clear();
    isEditing = false;
  }
}
