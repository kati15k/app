import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes_secondary/light_mode.dart';


class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const LoginButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: lightMode.colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        margin:  const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(
           text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.purpleAccent
            ),
          ),
        ),
      ),
    );
  }
}
