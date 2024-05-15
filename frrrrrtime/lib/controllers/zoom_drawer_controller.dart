import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();


  void toogleDraw(){
    zoomDrawerController.toggle?.call();
    update();
  }
  void signOut(){

  }
  void singIn(){

  }

  void page1(){

 }

  void email(){
  final Uri  emailLaunchUri =Uri(
     scheme: 'mailto',
     path: 'khadijahouda70@gmail.com'
    );
    _launch(emailLaunchUri.toString());
  }
  Future<void> _launch(String url) async{
  if(!await launch(url)){
  throw 'could not found $url';

  }
  
  }

}