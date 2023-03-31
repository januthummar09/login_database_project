import 'package:flutter/material.dart';

class CommonLoginButton extends StatelessWidget {
  final String? buttonName;
  final VoidCallback? onTap;
  const CommonLoginButton({Key? key, this.buttonName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFf558a1),
        minimumSize: const Size(double.infinity, 40),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      child: Text(buttonName ?? "LOGIN"),
    );
  }
}
