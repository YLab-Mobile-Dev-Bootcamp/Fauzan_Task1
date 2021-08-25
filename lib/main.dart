import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/common/app_color.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/views/main_page.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "QuranKu",
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: AppColor.createMaterialColor(Color(0xFF672CBC)),
        textTheme: AppFont.textTheme,
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
