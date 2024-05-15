import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes_third/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const MyButton({super.key, 
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Add padding for better text positioning
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: pinkiehh, // Use appropriate color
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}