import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes_secondary/light_mode.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextEditingController textcontroller;
  final Color myColor;

  const MyTextField({super.key, required this.hintText, required this.obscureText, required this.textcontroller, this.focusNode, required this.myColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: textcontroller,
        obscureText: obscureText,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: lightMode.colorScheme.tertiary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: lightMode.colorScheme.primary,
            ),
          ),
          fillColor: Colors.transparent,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w100,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
