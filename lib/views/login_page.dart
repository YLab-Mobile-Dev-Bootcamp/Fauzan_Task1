import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_project/controllers/login_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(375, 812),
    );
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250.w,
                height: 250.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/quran_icon.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.w),
              ),
              Text(
                "QuranKu",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 48.sp,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.w),
              ),
              MainButton(
                text: 'Login with Google',
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFc),
      ),
    );
  }
}

class MainButton extends GetView<LoginController> {
  final String text;
  const MainButton({this.text = 'tombol'});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(375, 812),
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        height: 60.w,
        width: 240.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10.w),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 14.w),
              blurRadius: 18.w,
              spreadRadius: -24.w,
              color: Colors.black45,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              controller.login();
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      'assets/icons/google_logo_single.svg',
                      height: 28.w,
                      width: 28.w,
                    ),
                    width: 28.w,
                    height: 28.w,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18.w,
                      color: Color(0xFF863ED5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
