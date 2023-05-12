import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color black = Colors.black;
Color white = Colors.white;
Color grey = Colors.grey;
const Color primaryColor = Color(0xff008b8b);
const Color enableColor = Color.fromARGB(255, 19, 85, 21);

TextStyle get onBoardingStyle {
  return GoogleFonts.righteous(
      textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w100,
    color: black,
  ));
}

TextStyle get authStyle {
  return GoogleFonts.righteous(
      textStyle: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: black,
  ));
}

TextStyle get homeStyle {
  return GoogleFonts.righteous(
      textStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w100,
    color: black,
  ));
}
