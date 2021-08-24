import 'package:flutter/material.dart';
import 'package:starter_project/main.dart';

class AppFont {
  static const String fontName = "Poppins";
  static const String arabicFontName = "Amiri";

  static const TextTheme textTheme = TextTheme(
    headline2: display1,
    headline3: display2,
    headline4: appBarTitle,
    headline5: tabBarTitle,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: arabicText,
    bodyText1: arabicText2,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Color(0xFF240F4F),
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Color(0xFF8789A3),
  );

  static const TextStyle appBarTitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Color(0xFF672CBC),
  );

  static const TextStyle tabBarTitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Color(0xFF672CBC),
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Color(0xFF240F4F),
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: Color(0xFF8789A3),
  );

  static const TextStyle arabicText = TextStyle(
    fontFamily: arabicFontName,
    fontSize: 18,
    color: Color(0xFF240F4F),
  );

  static const TextStyle arabicText2 = TextStyle(
    fontFamily: arabicFontName,
    fontSize: 20,
    color: Color(0xFF863ED5),
  );
}
