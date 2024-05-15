import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppIconText extends StatelessWidget {
  const AppIconText({super.key, required this.icon, required this.widget});

  final Icon icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 4,
        ),
        widget,
      ],
    );
  }
}
