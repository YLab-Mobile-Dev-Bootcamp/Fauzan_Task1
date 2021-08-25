import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/verse/controller/verse_controller.dart';
import 'package:starter_project/verse/view/verse_list_tile.dart';
import 'package:starter_project/views/main_page.dart';

// ignore: must_be_immutable
class ChapterDetails extends StatelessWidget {
  int? chapterId;
  int? versesCount;
  VerseController verseController = Get.put(VerseController());
  ChapterDetails({required int chapterId, required int versesCount}) {
    this.chapterId = chapterId;
    this.versesCount = versesCount;
    print("New verse for surah $chapterId controller initialized");
    verseController.fetchVerses(
        byChapterId: true,
        chapterId: this.chapterId,
        versesCount: this.versesCount);
    print("Akan ditampilkan surat dengan $versesCount ayat");
  }

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
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: double.infinity,
            width: 326.w,
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
                                      Icons.arrow_back,
                                      color: Color(0xFF8789A3),
                                    ),
                                  ),
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Get.off(() => MainPage());
                                      },
                                      child: Container(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        leadingWidth: 30.sp,
                        title: Row(
                          children: <Widget>[
                            Container(
                              height: 30.w,
                              width: 1.w,
                            ),
                            Text(
                              "${Get.arguments[1]}",
                              // verseController.verseList[0].verseKey!,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 30.w),
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
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                          msg: "Search belum bisa diakses",
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
                        ],
                        pinned: true,
                        floating: false,
                        centerTitle: true,
                        expandedHeight: 320.0.w,
                        backgroundColor: Colors.white,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          background: ChapterDetailsAppBarWidget(
                            chapterArgs: Get.arguments,
                          ),
                        ),
                        forceElevated: innerBoxIsScrolled,
                      ),
                    ),
                  ];
                },
                body: Obx(() {
                  if (verseController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return VerseListTile(
                      verseController: verseController,
                      name: "Detail Surat",
                    );
                  }
                }),
                // body: Center(
                //   child: Text("urrr"),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChapterDetailsAppBarWidget extends StatelessWidget {
  final dynamic chapterArgs;
  const ChapterDetailsAppBarWidget({required this.chapterArgs});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70.w,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0.w),
          child: Container(
            margin: EdgeInsets.only(top: 16.0.w, left: 8.0.w, right: 8.0.w),
            height: 257.w,
            // padding: EdgeInsets.only(left: 8.0, right: 8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
              ),
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0.w),
                        child: Container(
                          // width: 173,
                          // height: 99,
                          child: Image.asset(
                            "assets/images/quran.png",
                            height: 141.w,
                            width: 249.w,
                            fit: BoxFit.fitHeight,
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            colorBlendMode: BlendMode.dstIn,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        borderRadius: BorderRadius.circular(10.0.w),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 19.w),
                          ),
                          Text(
                            chapterArgs[1],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 26.sp,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.0.w),
                          ),
                          Text(
                            chapterArgs[5],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 19.0.w),
                          ),
                          Container(
                            height: 0.5.w,
                            width: 200.w,
                            color: Color(0xFFFFFFFF),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 19.0.w),
                          ),
                          Text(
                            "${chapterArgs[2]} - ${chapterArgs[3]} Ayat"
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 19.0.w),
                          ),
                          Bismillah(
                            bismillahPre: chapterArgs[4],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 19.0.w),
                          ),
                        ],
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

class Bismillah extends StatelessWidget {
  final bool bismillahPre;
  const Bismillah({required this.bismillahPre});

  @override
  Widget build(BuildContext context) {
    if (bismillahPre) {
      return SvgPicture.asset("assets/icons/bismillah.svg");
    } else {
      return Container(
        child: null,
      );
    }
  }
}
