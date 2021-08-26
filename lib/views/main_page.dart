import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_project/chapter/view/chapter_list_tile.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/controllers/main_controller.dart';
import 'package:starter_project/juz/controller/juz_controller.dart';
import 'package:starter_project/chapter/controller/chapter_controller.dart';
import 'package:starter_project/juz/view/juz_list_tile.dart';

class MainPage extends GetView<MainController> {
  final List<String> _tabs = <String>['Surah', 'Juz', 'Bookmark'];
  final ChapterController chapterController = Get.put(ChapterController());
  final JuzController juzController = Get.put(JuzController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(375, 812),
    );

    print(controller.user.displayName);

    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: double.infinity,
            width: 340.w,
            child: DefaultTabController(
              length: _tabs.length,
              child: Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder: (
                    BuildContext context,
                    bool innerBoxIsScrolled,
                  ) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          leading: Align(
                            alignment: Alignment.centerLeft,
                            child: Center(
                              child: Container(
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Icon(
                                        Icons.menu_outlined,
                                        color: Color(0xFF8789A3),
                                      ),
                                    ),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Fluttertoast.showToast(
                                            msg: "Menu belum bisa diakses",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.SNACKBAR,
                                          );
                                        },
                                        child: Container(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          leadingWidth: 30.w,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 30.w,
                                width: 1.w,
                              ),
                              Text(
                                "QuranKu",
                                style: AppFont.appBarTitle(
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Stack(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 30.w),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.search,
                                              color: Color(0xFF8789A3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Fluttertoast.showToast(
                                            msg: "Search belum bisa diakses",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.SNACKBAR,
                                          );
                                          controller.logout();
                                        },
                                        child: Container(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          pinned: true,
                          floating: false,
                          centerTitle: true,
                          expandedHeight: 320.0.w,
                          backgroundColor: Colors.white,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.none,
                            centerTitle: true,
                            background: AppBarWidget(
                              fullName: controller.user.displayName!,
                            ),
                          ),
                          forceElevated: innerBoxIsScrolled,
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(40.w),
                            child: Container(
                              color: Color(0xFFFFFFFF),
                              child: TabBar(
                                // These are the widgets to put in each tab in the tab bar.
                                tabs: _tabs
                                    .map(
                                      (String name) => Tab(
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            name,
                                            style: AppFont.tabBarTitle(
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: Obx(() {
                    if (chapterController.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return TabBarView(
                        children: <Widget>[
                          ChapterListTile(
                            chapterController: chapterController,
                            name: _tabs[0],
                          ),
                          JuzListTile(
                            juzController: juzController,
                            name: _tabs[1],
                          ),
                          Center(
                            child: Text(
                              "Belum dibikin",
                              style: AppFont.display2(
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  final String fullName;
  const AppBarWidget({this.fullName = "Hamba Allah"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 86.w,
        ),
        Container(
          margin: EdgeInsets.only(top: 0.0.w),
          width: double.infinity,
          padding: EdgeInsets.only(left: 8.0.w, right: 0.0.w),
          child: Text(
            'Assalamualaikum,',
            textAlign: TextAlign.start,
            style: AppFont.display2(
              fontSize: 18.sp,
            ),
          ),
          // color: Colors.black,
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0.w),
          width: double.infinity,
          padding: EdgeInsets.only(left: 8.0.w, right: 0.0.w),
          child: Text(
            fullName,
            textAlign: TextAlign.start,
            style: AppFont.display1(
              fontSize: 24.sp,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0.w),
          child: Container(
            margin: EdgeInsets.only(top: 16.0.w, left: 8.0.w, right: 8.0.w),
            height: 131.w,
            width: double.infinity,
            // padding: EdgeInsets.only(left: 8.0, right: 8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
              ),
              borderRadius: BorderRadius.circular(10.0.w),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "Kartu belum bisa diakses",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                  );
                },
                child: Stack(
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          width: 16.0.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 19.0.w),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.bookmark,
                                  color: Color(0xFFFFFFFF),
                                  size: 20.sp,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0.sp),
                                ),
                                Text(
                                  "Terakhir Dibaca",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 28.0.w),
                            ),
                            Text(
                              "Al-Fatihah",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0.w),
                            ),
                            Text(
                              "Ayat Ke: 1",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14.sp,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 19.0.w),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 0.0.w),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0.w),
                        child: Container(
                          width: 173.w,
                          height: 99.w,
                          child: Image.asset("assets/images/quran.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MainButton extends StatelessWidget {
  final String text;
  final Function onTapAction;
  const MainButton({this.text = 'tombol', required this.onTapAction});

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
        width: 140.w,
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
            onTap: () {},
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18.w,
                  color: Color(0xFF863ED5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
