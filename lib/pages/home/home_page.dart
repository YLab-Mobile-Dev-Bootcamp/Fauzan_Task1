import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/pages/home/home_controller.dart';
import 'package:starter_project/routes/app_routes.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Home Page",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
