import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       color: isCurrentUser ? Colors.indigoAccent.shade100: Colors.pinkAccent.shade100,
       borderRadius: BorderRadius.circular(12),
     ),
      padding:const EdgeInsets.all(16) ,
      margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 16),
      child: Text(
          message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 15,
        ),
      ),

    );
  }
}
