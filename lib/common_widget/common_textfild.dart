import 'package:flutter/material.dart';
import 'package:login_database_project/utils/helper.dart';

class CommonTextfildWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String Function(String?)? validator;

  const CommonTextfildWidget({Key? key, this.controller, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Helper helper = Helper();
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
      ),
    );
  }

  usernameValidator(String username) {
    if (username.isEmpty) {
      return 'Username empty';
    } else if (username.length < 3) {
      return 'Username short';
    }

    return null;
  }
}
