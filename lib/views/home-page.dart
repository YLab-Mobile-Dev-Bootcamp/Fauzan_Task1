import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_project/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(414, 896),
    );

    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: Scaffold(
        body: SingleChildScrollView(
          // padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 65.0),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 46.w),
                  height: 24.w,
                  width: 318.4.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          "assets/icons/menu.svg",
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        child:
                            SvgPicture.asset("assets/icons/shopping-cart.svg"),
                      ),
                    ],
                  ),
                ),
              ),
              // Padding(padding: EdgeInsets.only(bottom: 42)),
              Align(
                alignment: Alignment.center,
                child: Container(
                  // margin: EdgeInsets.only(bottom: 20.w),
                  height: 100.w,
                  width: 318.4.w,
                  child: Text(
                    "Delicious food\nfor you",
                    style: TextStyle(
                      fontSize: 34.sp,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 60.w,
                  width: 318.4.w,
                  margin: EdgeInsets.only(
                    bottom: 20.w,
                  ),
                  // margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29.5),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 17.sp,
                      height: 2.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        hintText: "Search",
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 40.w,
                  child: Container(
                    height: 60.w,
                    width: 318.4.w,
                    margin: EdgeInsets.only(bottom: 20.w),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: 40.w,
                          width: 110.w,
                          margin: EdgeInsets.only(left: 24.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF0635A),
                            ),
                            // color: Color(0xF2F2F2F2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.w),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Foods",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.w,
                          width: 110.w,
                          margin: EdgeInsets.only(left: 24.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF0635A),
                            ),
                            // color: Color(0xF2F2F2F2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.w),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Drinks",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.w,
                          width: 110.w,
                          margin: EdgeInsets.only(left: 24.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF0635A),
                            ),
                            // color: Color(0xF2F2F2F2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.w),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Snacks",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.w,
                          width: 110.w,
                          margin: EdgeInsets.only(left: 24.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF0635A),
                            ),
                            // color: Color(0xF2F2F2F2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.w),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sauces",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 312.w,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 220,
                      height: 312,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 60),
                              ),
                              Container(
                                width: 220,
                                height: 210,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.w),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: HexColor('#F8FAFB'),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16.0)),
                                          // border: new Border.all(
                                          //     color: DesignCourseAppTheme.notWhite),
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 16,
                                                              left: 16,
                                                              right: 16),
                                                      child: Text(
                                                        "Nasi seger",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          letterSpacing: 0.27,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8,
                                                              left: 16,
                                                              right: 16,
                                                              bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            'RM. Sabana Murah',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200,
                                                              fontSize: 12,
                                                              letterSpacing:
                                                                  0.27,
                                                              color: Colors
                                                                  .grey[600],
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  '4.8',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                    fontSize:
                                                                        18,
                                                                    letterSpacing:
                                                                        0.27,
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color(
                                                                      0xffF0635A),
                                                                  size: 20,
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 48,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24, right: 16, left: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0),
                                      ),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.grey[600]!
                                                .withOpacity(0.2),
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 6.0),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0)),
                                      child: Container(
                                        color: Colors.white,
                                        child: AspectRatio(
                                          aspectRatio: 1.28,
                                          child: SvgPicture.asset(
                                              'assets/icons/Hamburger.svg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
