import 'package:get/get.dart';
import 'package:starter_project/api/api_service.dart';
import 'package:starter_project/verse/model/verse_model.dart';

class VerseController extends GetxController {
  var isLoading = true.obs;
  var verseList = <VerseModel>[].obs;
  // bool? byChapterId;
  // bool? byJuzId;
  // int? chapterId;
  // int? juzId;
  // VerseController.byChapter({
  //   this.byChapterId,
  //   this.chapterId,
  // });

  // VerseController.byJuz({
  //   this.byJuzId,
  //   this.juzId,
  // });

  // @override
  // void onInit() {
  //   fetchVerses(
  //     byChapterId,
  //     byJuzId,
  //     chapterId,
  //     juzId,
  //   );
  //   super.onInit();
  // }

  void fetchVerses(
      {bool? byChapterId, bool? byJuzId, int? chapterId, int? juzId}) async {
    try {
      isLoading(true);
      if (byChapterId! && verseList.length == 0) {
        var verse = await ApiService.fetchVersesbyChapterId(chapterId!);
        if (verse != null) {
          verseList.assignAll(verse);
          print('dataFetched');
        }
      } else if (byJuzId! && verseList.length == 0) {
        var verse = await ApiService.fetchVersesbyJuzId(juzId!);
        if (verse != null) {
          verseList.assignAll(verse);
          print('dataFetched');
        }
      } else if (verseList.length > 0) {
        verseList.clear();
        print("Verse List cleared");
        fetchVerses(
          byChapterId: byChapterId,
          byJuzId: byJuzId,
          chapterId: chapterId,
          juzId: chapterId,
        );
        print(
            "Will fetching verses with byChapterId: $byChapterId, byJuzId: $byJuzId, chapterId: $chapterId, juzId: $juzId");
      }
    } finally {
      isLoading(false);
    }
  }
}
