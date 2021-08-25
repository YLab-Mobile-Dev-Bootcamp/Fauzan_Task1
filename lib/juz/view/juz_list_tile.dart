import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/juz/controller/juz_controller.dart';
import 'package:starter_project/juz/view/juz_details.dart';

class JuzListTile extends StatelessWidget {
  final JuzController juzController;
  final String name;
  const JuzListTile({required this.juzController, required this.name});

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
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(2.w),
                            title: Text(
                              'Juz ${juzController.juzList[index].juzNumber!}',
                              style: AppFont.title(
                                fontSize: 16.sp,
                              ),
                            ),
                            subtitle: Text(
                              '${juzController.juzList[index].firstVerseId!} - ${juzController.juzList[index].lastVerseId!}'
                                  .toUpperCase(),
                              style: AppFont.subtitle(
                                fontSize: 12.sp,
                              ),
                            ),
                            leading: SurahNumber(
                              surahNumber: juzController.juzList[index].id!,
                            ),
                            trailing: Text(
                              '${juzController.juzList[index].firstVerseId!}',
                              style: AppFont.arabicText2(
                                fontSize: 20.sp,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            tileColor: Colors.white,
                            onTap: () {
                              Get.to(
                                JuzDetails(),
                                arguments:
                                    juzController.juzList[index].juzNumber!,
                              );
                            },
                          ),
                          Container(
                            height: 0.5.w,
                            color: Colors.grey[300],
                          ),
                        ],
                      );
                    },
                    childCount: juzController.juzList.length,
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
