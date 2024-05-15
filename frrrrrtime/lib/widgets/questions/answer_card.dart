import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';

enum AnswerStatus{
  correct,wrong,answered, notanswered
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key, required this.answer, required this.onTap,  this.isSelected=false});
  final String answer;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: isSelected?answerSelectedColor():Theme.of(context).cardColor,
          border: Border.all(
            color: isSelected? answerSelectedColor():answerBorderColor(),
          )
        ),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected?onSurfaceTextColor:null,
          ),
        ),
      ),
    );
  }
}


class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key, required this.answer});
final String answer;
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: correctAnswerColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal:10,vertical: 20),
      child: Text(
        answer,
        style: const TextStyle(
        color:  correctAnswerColor,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}


class WrongAnswer extends StatelessWidget {
  const WrongAnswer({super.key, required this.answer});
final String answer;
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: wrongAnswerColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal:10,vertical: 20),
      child: Text(
        answer,
        style: const TextStyle(
        color:  wrongAnswerColor,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}


class NotAnswer extends StatelessWidget {
  const NotAnswer({super.key, required this.answer});
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: notAnsweredColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal:10,vertical: 20),
      child: Text(
        answer,
        style: const TextStyle(
          color:  notAnsweredColor,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}
