import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';


class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  _DemoAppState createState() =>_DemoAppState();
}

class _DemoAppState extends State<DemoApp>{
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  UploadTask? uploadTask;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async{
    try{
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null){
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());

        print('File name $_fileName');

      }
      setState(() {
        isLoading = false;

      });
    }catch(e){
      print(e);
    }
  }
  Future<void> uploadFile(PlatformFile file) async {
    final path ='files/${pickedfile!.name}';
    final file =File(pickedfile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: isLoading
                ?const CircularProgressIndicator()
                :TextButton(onPressed:(){
              pickFile();
            }, child:const Text('Upload File')),
          ),
          if(pickedfile !=null)
            SizedBox(
                height: 300,width: 400,child: Image.file(fileToDisplay!)),

        ],
      ),
    );
  }
}