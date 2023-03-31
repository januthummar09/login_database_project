import 'package:flutter/material.dart';

import '../../utils/text_style_fun.dart';

class HomeScreen extends StatelessWidget {
  final String? email;
  const HomeScreen({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Text(
          "Email------>>$email",
          style: textDeco(),
        ),
      ),
    );
  }
}
