import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frrrrrtime/bindings/initial_binding.dart';
import 'package:frrrrrtime/controllers/theme_controller.dart';
import 'package:frrrrrtime/controllers/zoom_drawer_controller.dart'; // Import the ZoomDrawerController
import 'package:frrrrrtime/firebase_options.dart';
import 'package:frrrrrtime/routes/app_routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies(); // Initialize dependencies

  // Initialize the ZoomDrawerController
  Get.put(MyZoomDrawerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
