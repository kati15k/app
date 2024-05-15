import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluehh = Color(0xff00f8f8);
const Color orangehh = Color(0xffd7cf2f);
const Color pinkiehh = Color(0xFFf85187);

const Color darkhh = Color(0xFF121212);
Color darkheader = Colors.grey[800]!;
const Color whitehh = Color(0xffffffff);

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
      background: Colors.white,
    ),
  );
  static final dark = ThemeData(
    primaryColor: darkheader,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey,
      background: Colors.grey[800]!,
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600],
    ),
  );
}
