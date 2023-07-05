import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColor.primaryColor),
    titleTextStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: "PlayfairDisplay",
        fontSize: 25),
    backgroundColor: Colors.grey[50],
  ),
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);
TextStyle get titleStyle {
  return GoogleFonts.raleway(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  ));
}

TextStyle get bodyStyle {
  return GoogleFonts.raleway(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  ));
}

TextStyle get numberStyle {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  ));
}
