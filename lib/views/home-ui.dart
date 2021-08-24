import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeUi extends StatefulWidget {
  HomeUi({Key? key}) : super(key: key);

  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      // allowFontScaling: false,
      designSize: Size(375, 812),
    );

    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
      mobile: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0x00ffffff),
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.w,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180.w,
                      decoration: BoxDecoration(
                          color: Color(0xFF4A43EC),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(33.w),
                              bottomRight: Radius.circular(33.w))),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 117.w),
                        height: 36.w,
                        width: 327.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 24.w,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Current Location",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                                Text(
                                  "New York",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(28.w),
                                ),
                              ),
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 24.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 40.w,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              height: 40.w,
                              width: 110.w,
                              margin: EdgeInsets.only(left: 24.w),
                              decoration: BoxDecoration(
                                  color: Color(0xffF0635A),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.w),
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                  Text("Sports",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp))
                                ],
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 110.w,
                              margin: EdgeInsets.only(left: 11.w),
                              decoration: BoxDecoration(
                                  color: Color(0xffF59762),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.w),
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.music_note,
                                    color: Colors.white,
                                  ),
                                  Text("Music",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp))
                                ],
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 110.w,
                              margin: EdgeInsets.only(left: 11.w),
                              decoration: BoxDecoration(
                                color: Color(0xff29D697),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.w),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.fastfood,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Foods",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 110.w,
                              margin: EdgeInsets.only(left: 11.w),
                              decoration: BoxDecoration(
                                color: Color(0xffF0635A),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.w),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Sports",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Upcoming Events",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "See all",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              SizedBox(
                height: 255.w,
                child: ListView(
                  //shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 237.w,
                      height: 255.w,
                      margin: EdgeInsets.only(left: 20.w),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18.w)),
                        boxShadow: [
                          // BoxShadow(
                          //     blurRadius: 30.w,
                          //     color: Color(0xff505588).withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     offset: Offset(0, 8.w))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 131.w,
                            width: 218.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('asset/ic_hand.png'),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(18.w),
                              ),
                              boxShadow: [
                                // BoxShadow(
                                //     blurRadius: 30.w,
                                //     color: Color(0xff505588).withOpacity(0.5),
                                //     spreadRadius: 0,
                                //     offset: Offset(0, 8.w))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: Text(
                              'International Band Murah Long text',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('asset/ic_hand.png'),
                                        fit: BoxFit.cover),
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24.w)),
                                    boxShadow: [
                                      // BoxShadow(
                                      //     blurRadius: 30.w,
                                      //     color: Color(0xff505588).withOpacity(0.5),
                                      //     spreadRadius: 0,
                                      //     offset: Offset(0, 8.w))
                                    ],
                                  ),
                                ),
                                Text(
                                  '20 +',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 12.sp),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 16.w,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  '28 Guild Street London, UK',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13.sp),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 237.w,
                      height: 255.w,
                      margin: EdgeInsets.only(left: 16.w),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18.w)),
                        boxShadow: [
                          // BoxShadow(
                          //     blurRadius: 30.w,
                          //     color: Color(0xff505588).withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     offset: Offset(0, 8.w))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 131.w,
                            width: 218.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('asset/ic_hand.png'),
                                  fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.w)),
                              boxShadow: [
                                // BoxShadow(
                                //     blurRadius: 30.w,
                                //     color: Color(0xff505588).withOpacity(0.5),
                                //     spreadRadius: 0,
                                //     offset: Offset(0, 8.w))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: Text(
                              'International Band Murah Long text',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('asset/ic_hand.png'),
                                        fit: BoxFit.cover),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24.w),
                                    ),
                                    boxShadow: [
                                      // BoxShadow(
                                      //     blurRadius: 30.w,
                                      //     color: Color(0xff505588).withOpacity(0.5),
                                      //     spreadRadius: 0,
                                      //     offset: Offset(0, 8.w))
                                    ],
                                  ),
                                ),
                                Text(
                                  '20 +',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 12.sp),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 16.w,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  '28 Guild Street London, UK',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13.sp),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 127.w,
                width: 328.w,
                margin: EdgeInsets.only(top: 29.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/ic_banner.png'),
                      fit: BoxFit.fitWidth),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.w),
                  ),
                  boxShadow: [
                    // BoxShadow(
                    //     blurRadius: 30.w,
                    //     color: Color(0xff505588).withOpacity(0.5),
                    //     spreadRadius: 0,
                    //     offset: Offset(0, 8.w))
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text("Events"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text("Maps"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
      tablet: Container(color: Colors.yellow),
      desktop: Container(color: Colors.red),
      watch: Container(color: Colors.purple),
    );
  }
}
