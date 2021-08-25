import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starter_project/chapter/controller/chapter_controller.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/chapter/view/chapter_details.dart';

class ChapterListTile extends StatelessWidget {
  final ChapterController chapterController;
  final String name;
  const ChapterListTile({required this.chapterController, required this.name});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(375, 812),
    );

    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>(name),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: EdgeInsets.all(0.0.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding: EdgeInsets.all(2.w),
                            title: Text(
                              chapterController.chapterList[index].nameSimple!,
                              style: AppFont.title(
                                fontSize: 16.sp,
                              ),
                            ),
                            subtitle: Text(
                              '${chapterController.chapterList[index].revelationPlace!} - ${chapterController.chapterList[index].versesCount!} Ayat'
                                  .toUpperCase(),
                              style: AppFont.subtitle(
                                fontSize: 12.sp,
                              ),
                            ),
                            leading: SurahNumber(
                              surahNumber:
                                  chapterController.chapterList[index].id!,
                            ),
                            trailing: Text(
                              chapterController.chapterList[index].nameArabic!,
                              style: AppFont.arabicText2(
                                fontSize: 20.sp,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            tileColor: Colors.white,
                            onTap: () {
                              print(chapterController
                                  .chapterList[index].versesCount!);
                              Get.to(
                                () => ChapterDetails(
                                  chapterId:
                                      chapterController.chapterList[index].id!,
                                  versesCount: chapterController
                                      .chapterList[index].versesCount!,
                                ),
                                arguments: [
                                  chapterController.chapterList[index].id!,
                                  chapterController
                                      .chapterList[index].nameSimple!,
                                  chapterController
                                      .chapterList[index].revelationPlace!,
                                  chapterController
                                      .chapterList[index].versesCount!,
                                  chapterController
                                      .chapterList[index].bismillahPre!,
                                  chapterController
                                      .chapterList[index].translatedName!.name,
                                ],
                              );
                              print("Berhasil pergi ke detail surat");
                            },
                          ),
                          Container(
                            height: 0.5.w,
                            color: Colors.grey[300],
                          ),
                        ],
                      );
                    },
                    childCount: chapterController.chapterList.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SurahNumber extends StatelessWidget {
  final int surahNumber;
  const SurahNumber({required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(375, 812),
    );

    return Container(
      width: 36.sp,
      height: 36.sp,
      child: Stack(
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              "assets/icons/ornament.svg",
              height: 36.sp,
              width: 36.sp,
            ),
          ),
          Center(
            child: Text(
              "$surahNumber",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Color(0xFF240F4F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
