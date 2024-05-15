import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';
import 'package:frrrrrtime/widgets/app_circle_button.dart';
import 'package:get/get.dart';


class Introduction extends StatelessWidget {
  const Introduction({super.key});
  static const String routeName= "/login";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 65),
              const SizedBox(height: 40),
              const Text(
                "This is a study app. You can use it how you want, hdheuzbxbcrytimzmkjndgytecbtechzhdhd",
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20), // Adjusted spacing
              AppCircleButton(
                onTap: () => Get.offAndToNamed('/login'),
                width: 30,
                child: const Icon(Icons.arrow_forward, size: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
