import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frrrrrtime/controllers/questions_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../firebase_ref/references.dart';
import '../../services/auth_service.dart';
import '../auth_controller.dart';

extension QuestionsControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions{
    return '$correctQuestionCount out of ${allQuestions.length} are correct';

  }
  String get points {
    var points = (correctQuestionCount/allQuestions.length)*100*
      (questionPaperModel.timeSeconds- remainSeconds)/questionPaperModel.timeSeconds*100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestResults() async {
    try {
      var batch = FirebaseFirestore.instance.batch();
      User? user = AuthService().getCurrentUser();
      if (user == null) {
        print('User is null');
        return;
      }
      batch.set(
        userRF.doc(user.uid).collection('recent_tests').doc(questionPaperModel.id),
        {
          'points': points,
          'correctAnswers': '$correctQuestionCount/${allQuestions.length}',
          'question_id': questionPaperModel.id,
          'time': questionPaperModel.timeSeconds - remainSeconds,
        },
      );
      await batch.commit();
      print('Test results saved successfully');
      navigateToHome();
    } catch (e) {
      print('Error saving test results: $e');
    }
  }

}
