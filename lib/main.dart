import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:starter_project/routes/app_pages.dart';
import 'package:starter_project/routes/app_routes.dart';
import 'package:starter_project/themes/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Getx App with API",
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.dark,
      theme: AppThemes.light,
      themeMode: ThemeMode.system,
    );
  }
}
