import 'package:flutter/material.dart';
import 'package:frrrrrtime/controllers/question_paper/data_uploader.dart';
import 'package:frrrrrtime/firebase_ref/loading_status.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
   DataUploaderScreen({super.key});
DataUploader controller= Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: 
          Obx(()=>Text(controller.loadingstatus.value==LoadingStatus.completed?
          "Uploading Completed":"Uploading in Progress..")),
      ) ,
    );
  }
}
