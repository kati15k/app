import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:frrrrrtime/firebase_ref/loading_status.dart';
import 'package:frrrrrtime/firebase_ref/references.dart';
import 'package:frrrrrtime/models/question_paper_model.dart';
import 'package:get/get.dart';


class DataUploader extends GetxController {
  @override
  void onReady(){
    uploadData();
  super.onReady();
}
final loadingstatus =LoadingStatus.loading.obs;// loadingStatus is obs type

  Future <void> uploadData() async{
  loadingstatus.value=LoadingStatus.loading; //0

  final fireStore=FirebaseFirestore.instance;
  final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
  final Map<String,dynamic> manifestMap =json.decode(manifestContent);

   //load the path and files name

   final papersInAssets =manifestMap.keys
      .where((path) => path.startsWith("assets/DB/papers")&& path.contains(".json")).toList();

   List<QuestionPaperModel> questionPapers=[];
   for(var paper in papersInAssets){
     String stringPaperContent =await rootBundle.loadString(paper);

   // json.decode takes a string and convert it to a map
    questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
   }
   var batch =fireStore.batch();
   for (var paper in questionPapers){
     batch.set(questionPaperRF.doc(paper.id), {
       "title":paper.title,
       "image_url":paper.imageUrl,
       "description":paper.description,
       "time_seconds":paper.timeSeconds,
       "question_count":paper.questions==null?0:paper.questions!.length

     });
     for(var questions in paper.questions!) {
 final questionPath= questionRF(paperId: paper.id, questionId: questions.id);
  batch.set(questionPath, {
    "question": questions.question,
    "correct_answer":questions.correctAnswer
  });
  for(var answer in questions.answers){
    batch.set(
        questionPath.collection("answers").doc(answer.identifier),{
      "identifier": answer.identifier,
      "answer": answer.answer
    }
    );
  }
     }
     }

    await batch.commit();
   loadingstatus.value=LoadingStatus.completed;
  }

  }
