import 'package:flutter/material.dart';

class AppFont {
  static const String fontName = "Poppins";
  static const String arabicFontName = "Amiri";

  static TextTheme textTheme = TextTheme(
    headline2: display1(),
    headline3: display2(),
    headline4: appBarTitle(),
    headline5: tabBarTitle(),
    headline6: title(),
    subtitle2: subtitle(),
    bodyText2: arabicText(),
    bodyText1: arabicText2(),
  );

  static TextStyle display1({fontSize = 24.0}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: Color(0xFF240F4F),
    );
  }

  static TextStyle display2({fontSize = 18.0}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: Color(0xFF8789A3),
    );
  }

  static TextStyle appBarTitle({fontSize = 20.0}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w800,
      fontSize: fontSize,
      color: Color(0xFF672CBC),
    );
  }

  static TextStyle tabBarTitle({fontSize = 16.0}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: Color(0xFF672CBC),
    );
  }

  static TextStyle title({fontSize = 16.0}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: Color(0xFF240F4F),
    );
  }

  static TextStyle subtitle({fontSize = 12.0}) {
    return TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: Color(0xFF8789A3),
    );
  }

  static TextStyle bodyText({fontSize = 12.0}) {
    return TextStyle(
      fontFamily: fontName,
      fontSize: fontSize,
      color: Color(0xFF8789A3),
    );
  }

  static TextStyle arabicText({fontSize = 18.0}) {
    return TextStyle(
      fontFamily: arabicFontName,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: Color(0xFF240F4F),
    );
  }

  static TextStyle arabicText2({fontSize = 20.0}) {
    return TextStyle(
      fontFamily: arabicFontName,
      fontSize: fontSize,
      color: Color(0xFF863ED5),
    );
  }
}
