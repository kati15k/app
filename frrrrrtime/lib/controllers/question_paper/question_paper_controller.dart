import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frrrrrtime/firebase_ref/references.dart';
import 'package:frrrrrtime/models/question_paper_model.dart';
import 'package:frrrrrtime/services/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:frrrrrtime/screens/question/questions_screen.dart';
class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl =imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }
  void navigateToQuestions({required String routeName,required QuestionPaperModel paper}) {
    Get.toNamed(QuestionsScreen.routeName,arguments: paper);

  }
  void navigateToQuestion({required QuestionPaperModel paper,bool tryAgain=false}) {
    if (tryAgain) {
      Get.back();
    } else {
      Get.toNamed(QuestionsScreen.routeName, arguments: paper);
    }
  }
}
