import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: const Center(
          child: SizedBox(
            width: 200,
            height: 200,
           // child: Image.asset("assets/images/app_splash_logo.png"),
          ),
        ),
      ),
    );
  }
}
