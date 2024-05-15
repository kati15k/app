
import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';

TextStyle cartTitles(context)=>TextStyle(
  color: UIParameters.isDarkMode() ? Theme.of(context).textTheme.bodyLarge!.color:
  Theme.of(context).primaryColor,
  fontSize: 19,
  fontWeight: FontWeight.bold,
);
const questionText = TextStyle(fontSize: 16,fontWeight: FontWeight.w800);
const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(fontSize: 22, fontWeight: FontWeight.w700,
color: onSurfaceTextColor
);

const appBarTS= TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: onSurfaceTextColor
);

TextStyle countDownTimerr()=>TextStyle(
  letterSpacing: 2,
  color: UIParameters.isDarkMode()?Theme.of(Get.context!).textTheme.bodyLarge!.color:
    Theme.of(Get.context!).primaryColor

);