import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoadDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: Container(
          child: Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xFFFFFFFF)),
          )),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Color(0xFF863ED5),
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
