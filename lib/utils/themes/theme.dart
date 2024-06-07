import 'package:blog_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static ThemeData appThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.appBackgroundColor,
    fontFamily: GoogleFonts.lora().fontFamily,
    textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(
          fontSize: 12,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 230, 130, 80),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}
