import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton({super.key,
    required this.child,
    this.color,
    required this.width,
    this.onTap

  });
final Widget child;
final Color? color;
final double width;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: child));
}}
