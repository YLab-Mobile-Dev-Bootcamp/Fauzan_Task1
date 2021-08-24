import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/views/chapter_details.dart';
import 'package:starter_project/chapter/controller/chapter_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final List<String> _tabs = <String>['Surah', 'Juz', 'Hizb'];
  final ChapterController chapterController = Get.put(ChapterController());

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
                          leading: Icon(
                            Icons.menu,
                            color: Color(0xFF8789A3),
                          ),
                          leadingWidth: 20,
                          title: Row(
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 10,
                              ),
                              Text(
                                "Quran Kareem",
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
                            background: AppBarWidget(),
                          ),
                          forceElevated: innerBoxIsScrolled,
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(50),
                            child: Container(
                              color: Color(0xFFFFFFFF),
                              child: TabBar(
                                // These are the widgets to put in each tab in the tab bar.
                                tabs: _tabs
                                    .map((String name) => Tab(
                                          child: Text(
                                            name,
                                            style: AppFont.tabBarTitle,
                                          ),
                                        ))
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
                        // These are the contents of the tab views, below the tabs.
                        children: _tabs.map(
                          (String name) {
                            return SafeArea(
                              top: false,
                              bottom: false,
                              child: Builder(
                                builder: (BuildContext context) {
                                  return CustomScrollView(
                                    key: PageStorageKey<String>(name),
                                    slivers: <Widget>[
                                      SliverOverlapInjector(
                                        handle: NestedScrollView
                                            .sliverOverlapAbsorberHandleFor(
                                                context),
                                      ),
                                      SliverPadding(
                                        padding: const EdgeInsets.all(0.0),
                                        sliver: SliverFixedExtentList(
                                          itemExtent: 80.0,
                                          delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index) {
                                              return ListTile(
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                title: Text(
                                                  chapterController
                                                      .chapterList[index]
                                                      .nameSimple!,
                                                  style: AppFont.title,
                                                ),
                                                subtitle: Text(
                                                  '${chapterController.chapterList[index].revelationPlace!} - ${chapterController.chapterList[index].versesCount!} Verses'
                                                      .toUpperCase(),
                                                  style: AppFont.subtitle,
                                                ),
                                                leading: SurahNumber(
                                                  surahNumber: chapterController
                                                      .chapterList[index].id!,
                                                ),
                                                trailing: Text(
                                                  chapterController
                                                      .chapterList[index]
                                                      .nameArabic!,
                                                  style: AppFont.arabicText2,
                                                  textAlign: TextAlign.right,
                                                ),
                                                tileColor: Colors.white,
                                                onTap: () {
                                                  Get.to(
                                                    ChapterDetails(),
                                                    arguments: chapterController
                                                        .chapterList[index]
                                                        .nameSimple!,
                                                  );
                                                },
                                              );
                                            },
                                            childCount: chapterController
                                                .chapterList.length,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        ).toList(),
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

class SurahNumber extends StatelessWidget {
  final int surahNumber;
  const SurahNumber({required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      child: Stack(
        children: <Widget>[
          Center(child: SvgPicture.asset("assets/icons/ornament.svg")),
          Center(
            child: Text(
              "$surahNumber",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF240F4F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 86,
        ),
        Container(
          margin: EdgeInsets.only(top: 0.0),
          width: double.infinity,
          padding: EdgeInsets.only(left: 8.0, right: 0.0),
          child: Text(
            'Assalamualaikum,',
            textAlign: TextAlign.start,
            style: AppFont.display2,
          ),
          // color: Colors.black,
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          width: double.infinity,
          padding: EdgeInsets.only(left: 8.0, right: 0.0),
          child: Text(
            'Fauzan Abdillah',
            textAlign: TextAlign.start,
            style: AppFont.display1,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            margin: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
            height: 131,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 19.0),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bookmark,
                              color: Color(0xFFFFFFFF),
                              size: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                            ),
                            Text(
                              "Last Read",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 28.0),
                        ),
                        Text(
                          "Al-Fatihah",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.0),
                        ),
                        Text(
                          "Ayah No: 1",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 19.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24.0),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 173,
                          height: 99,
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
