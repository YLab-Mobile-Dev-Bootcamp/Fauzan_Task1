import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/controllers/load_auth_controller.dart';

class LoadAuthPage extends GetView<LoadAuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
