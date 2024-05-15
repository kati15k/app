import 'package:frrrrrtime/controllers/auth_controller.dart';
import 'package:frrrrrtime/controllers/theme_controller.dart';
import 'package:frrrrrtime/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings{
  @override
  void dependencies(){
    Get.put(FirebaseStorageService());
    Get.put(ThemeController());
    Get.put(AuthController(),permanent: true);
  }

}