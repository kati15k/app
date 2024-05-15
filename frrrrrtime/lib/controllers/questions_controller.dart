import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:frrrrrtime/controllers/question_paper/question_paper_controller.dart';
import 'package:frrrrrtime/controllers/question_paper/questions_controller_extension.dart';
import 'package:frrrrrtime/firebase_ref/loading_status.dart';
import 'package:frrrrrtime/models/question_paper_model.dart';
import 'package:frrrrrtime/screens/question/result_screen.dart';
import 'package:get/get.dart';

import '../firebase_ref/references.dart';

class QuestionsController extends GetxController {
  final loadingStatus= LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions =<Questions>[];
  final questionIndex=0.obs;
  bool get isFirstQuestion=> questionIndex.value >0;
  bool get isLastQuestion=>questionIndex.value>=allQuestions.length-1;
  Rxn<Questions> currentQuestion=Rxn<Questions>();
//Timer
  Timer? _timer;
  int remainSeconds=1;
  final time ='00.00'.obs;

  @override
  void onReady() {
    final questionPaper = Get.arguments as QuestionPaperModel?;
    print("..onReady..");
    if (questionPaper != null) {
      loadData(questionPaper);
    }else{
      print("..QuestionPaperisnull..");
    }
    super.onReady();
  }

  Future <void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();
     final questions= questionQuery.docs.map((snapshot) => Questions.
      fromSnapshot(snapshot)).toList();
      questionPaper.questions=questions;

      for(Questions _question in questionPaper.questions!){
       final QuerySnapshot<Map<String,dynamic>> answersQuery= await questionPaperRF.doc(questionPaper.id).collection("questions")
            .doc(_question.id).collection("answers").get();
    final answers = answersQuery.docs.map((answer) => Answers.fromSnapshot(answer)).
    toList();
       _question.answers= answers;
      }
      print("Data loaded");
    } catch (e) {
      if (kDebugMode) {
        print("error loading data: $e");
      }
    }

    if(questionPaper.questions!=null && questionPaper.questions!.isNotEmpty){
      allQuestions.assignAll(questionPaper.questions!);
      currentQuestion.value= questionPaper.questions![0];
      _startTimer(questionPaper.timeSeconds);
      print("..startTimer..");
      if (kDebugMode) {
        print(questionPaper.questions![0].question);
      }

      loadingStatus.value=LoadingStatus.completed;
    }else{
      loadingStatus.value=LoadingStatus.error;
    }
  }

  void selectedAnswer(String ? answer){

    currentQuestion.value!.selectedAnswer=answer;
    update(['answers_list','answer_review_list']);

  }

  String get completedTest{
    final answered=
    allQuestions.where((element) =>
    element.selectedAnswer!=null).
    toList().length;

    return '$answered out of ${allQuestions.length} answered';
  }

  void jumpToQuestion(int index , {isGoBack = true}){
    questionIndex.value=index;
    currentQuestion.value= allQuestions[index];
    if(isGoBack){
      Get.back();
    }
  }

  void nextQuestion (){
    if(questionIndex.value>=allQuestions.length-1){
        return;}
        questionIndex.value++;
      currentQuestion.value=allQuestions[questionIndex.value];
  }

  void prevQuestion (){
    if(questionIndex.value <= 0){
        return;}
        questionIndex.value--;
      currentQuestion.value=allQuestions[questionIndex.value];
  }

  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainSeconds=seconds;
    _timer=Timer.periodic(duration, (Timer timer) {
      if(remainSeconds==0){
        timer.cancel();
      }else{
        int minutes = remainSeconds~/60;
        int seconds= remainSeconds%60;
        time.value= "${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}";
        remainSeconds--;


      }

    });

  }

  void complete(){
    saveTestResults();
    _timer!.cancel();
    Get.offAndToNamed(ResultScreen.routeName);

  }

  void tryAgain(){

    Get.find<QuestionPaperController>().navigateToQuestion(paper: questionPaperModel,
    tryAgain: true
    );
  }

void navigateToHome(){
  _timer!.cancel();
  Get.toNamed("/home");
}
  }




