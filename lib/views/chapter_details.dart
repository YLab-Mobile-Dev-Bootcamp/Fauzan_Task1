import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/common/app_font.dart';

class ChapterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${Get.arguments}",
          style: AppFont.display1,
        ),
      ),
    );
  }
}
