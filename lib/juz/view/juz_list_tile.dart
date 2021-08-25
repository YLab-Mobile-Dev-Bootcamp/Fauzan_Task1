import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starter_project/chapter/controller/chapter_controller.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/juz/controller/juz_controller.dart';
import 'package:starter_project/chapter/view/chapter_details.dart';
import 'package:starter_project/juz/view/juz_details.dart';

class JuzListTile extends StatelessWidget {
  final JuzController juzController;
  final String name;
  const JuzListTile({required this.juzController, required this.name});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(0.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: Text(
                              'Juz ${juzController.juzList[index].juzNumber!}',
                              style: AppFont.title,
                            ),
                            subtitle: Text(
                              '${juzController.juzList[index].firstVerseId!} - ${juzController.juzList[index].lastVerseId!}'
                                  .toUpperCase(),
                              style: AppFont.subtitle,
                            ),
                            leading: SurahNumber(
                              surahNumber: juzController.juzList[index].id!,
                            ),
                            trailing: Text(
                              '${juzController.juzList[index].firstVerseId!}',
                              style: AppFont.arabicText2,
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
                            height: 0.5,
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
