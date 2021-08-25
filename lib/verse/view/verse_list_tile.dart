import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:get/get.dart';
import 'package:starter_project/common/app_font.dart';
import 'package:starter_project/verse/controller/verse_controller.dart';

class VerseListTile extends StatelessWidget {
  final VerseController verseController;
  final String name;
  const VerseListTile({required this.verseController, required this.name});

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
                      return Container(
                        color: Color(0xFFFFFFFF),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 20,
                              color: Color(0xFFFFFFFF),
                            ),
                            VerseTile(
                              verseNumber:
                                  verseController.verseList[index].verseNumber!,
                              completeVerse:
                                  verseController.verseList[index].textImlaei!,
                              completeTranslation: verseController
                                  .verseList[index].translations![0].text!,
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: verseController.verseList.length,
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

class VerseTile extends StatelessWidget {
  final int verseNumber;
  final String completeVerse;
  final String completeTranslation;
  VerseTile({
    required this.verseNumber,
    required this.completeVerse,
    required this.completeTranslation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 183,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 47,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFFF9F5FD),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12),
                  ),
                ),
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: Color(0xFF863ED5),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('$verseNumber',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Color(0xFFFFFFFF),
                        )),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Icon(
                          Icons.share_outlined,
                          color: Color(0xFF863ED5),
                          size: 24.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: "Fitur Share belum bisa diakses",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                          );
                        },
                        child: Container(
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Color(0xFF863ED5),
                          size: 28.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: "Audio belum bisa diakses",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                          );
                        },
                        child: Container(
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Icon(
                          Icons.bookmark_border_outlined,
                          color: Color(0xFF863ED5),
                          size: 24.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: "Fitur bookmark belum bisa diakses",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                          );
                        },
                        child: Container(
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 3,
                    right: 3,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        completeVerse,
                        softWrap: true,
                        style: AppFont.arabicText,
                        textAlign: TextAlign.right,
                        textHeightBehavior: TextHeightBehavior(
                          leadingDistribution:
                              TextLeadingDistribution.proportional,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 3.0,
                    right: 3.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _parseHtmlString(completeTranslation),
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        color: Color(0xFF240F4F),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    // Html(data: completeTranslation),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
          ),
        ],
      ),
    );
  }
}

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString.replaceAll(RegExp(r'[0-9]'), '');
}
