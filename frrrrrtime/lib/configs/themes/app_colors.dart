import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/app_dark_theme.dart';
import 'package:frrrrrtime/configs/themes/app_light_theme.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';


const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFFf85187);
const Color notAnsweredColor = Color(0xFF2a3c65);




const mainGradientLight  = LinearGradient(
  begin: Alignment.topLeft,
  end : Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight
  ]

);
const mainGradientDark  = LinearGradient(
  begin: Alignment.topLeft,
  end : Alignment.bottomRight,
  colors: [
    primaryDarkColorDark,
    primaryColorDark
  ]

);

LinearGradient mainGradient()=>
    UIParameters.isDarkMode() ?mainGradientDark: mainGradientLight;

Color  customScaffoldColor(BuildContext context) =>
    UIParameters.isDarkMode()?const Color(0xFF2e3c62):
        const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor()=>  UIParameters.isDarkMode()?Theme.of(Get.context!).cardColor.withOpacity(0.5)
    :Theme.of(Get.context!).primaryColor;

Color answerBorderColor()=> UIParameters.isDarkMode()?
    const Color.fromARGB(255, 20, 46, 158)
    :const Color.fromARGB(255, 221, 221, 221);