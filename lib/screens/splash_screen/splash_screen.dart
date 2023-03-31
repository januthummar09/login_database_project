import 'package:flutter/material.dart';

import '../../utils/text_style_fun.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: textDeco(),
        ),
      ),
    );
  }
}
