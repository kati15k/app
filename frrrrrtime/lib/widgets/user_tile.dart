import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes_secondary/light_mode.dart';


class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
       decoration: BoxDecoration(
         color: lightMode.colorScheme.secondary,
         borderRadius: BorderRadius.circular(12),
       ),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(Icons.person_pin,
            color: lightMode.colorScheme.primary,),
            const SizedBox(
              width: 25,
            ),
            Text(text),

          ],
        ),
      ),
    );
  }
}
