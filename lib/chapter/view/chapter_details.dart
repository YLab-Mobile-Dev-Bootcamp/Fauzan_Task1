import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/verse/controller/verse_controller.dart';
import 'package:starter_project/verse/view/verse_list_tile.dart';
import 'package:starter_project/views/main_page.dart';

// ignore: must_be_immutable
class ChapterDetails extends StatelessWidget {
  int? chapterId;
  VerseController verseController = Get.put(VerseController());
  ChapterDetails(int? chapterId) {
    this.chapterId = chapterId!;
    print("New verse for surah $chapterId controller initialized");
    verseController.fetchVerses(byChapterId: true, chapterId: this.chapterId);
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
            width: 326,
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
                          child: TextButton(
                            onPressed: () {
                              Get.off(() => MainPage());
                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xFF8789A3),
                              ),
                            ),
                          ),
                        ),
                        leadingWidth: 20,
                        title: Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 10,
                            ),
                            Text(
                              "${Get.arguments[1]}",
                              // verseController.verseList[0].verseKey!,
                              style: AppFont.appBarTitle,
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          Container(
                            child: Icon(
                              Icons.search,
                              color: Color(0xFF8789A3),
                            ),
                          ),
                        ],
                        pinned: true,
                        floating: false,
                        centerTitle: true,
                        expandedHeight: 320.0,
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
          height: 66,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            margin: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
            height: 257,
            // padding: EdgeInsets.only(left: 8.0, right: 8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
              ),
              borderRadius: BorderRadius.circular(10.0),
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
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          // width: 173,
                          // height: 99,
                          child: Image.asset(
                            "assets/images/quran.png",
                            height: 141,
                            width: 249,
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 19.0),
                          ),
                          Text(
                            chapterArgs[1],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.0),
                          ),
                          Text(
                            chapterArgs[5],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 19.0),
                          ),
                          Container(
                            height: 0.5,
                            width: 200,
                            color: Color(0xFFFFFFFF),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 19.0),
                          ),
                          Text(
                            "${chapterArgs[2]} - ${chapterArgs[3]} Verses"
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 19.0),
                          ),
                          Bismillah(
                            bismillahPre: chapterArgs[4],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 19.0),
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
