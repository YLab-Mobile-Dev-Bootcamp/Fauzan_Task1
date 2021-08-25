import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/views/main_page.dart';

class JuzDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Juz ${Get.arguments}\nPage belum dibuat.",
                textAlign: TextAlign.center,
                style: AppFont.display1,
              ),
              TextButton(
                onPressed: () {
                  Get.off(() => MainPage());
                },
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                child: MainButton(text: 'Kembali ke Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String text;
  const MainButton({this.text = 'tombol'});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      height: 60,
      width: 240,
      decoration: BoxDecoration(
        color: Color(0xFF863ED5),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 14),
            blurRadius: 18,
            spreadRadius: -24,
            color: Colors.black45,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
