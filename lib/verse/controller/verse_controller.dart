import 'package:get/get.dart';
import 'package:starter_project/api/api_service.dart';
import 'package:starter_project/verse/model/verse_model.dart';

class VerseController extends GetxController {
  var isLoading = true.obs;
  var verseList = <VerseModel>[].obs;

  int page = 1;

  void fetchVerses({
    bool? byChapterId,
    bool? byJuzId,
    int? chapterId,
    int? juzId,
    int? versesCount,
  }) async {
    try {
      isLoading(true);
      if (byChapterId!) {
        var verse = await ApiService.fetchVersesbyChapterId(
            chapterId: chapterId!, page: this.page);
        if (verse != null) {
          verseList.addAll(verse);
          if (verseList.length <= versesCount!) {
            this.page = this.page + 1;
            fetchVerses(
              byChapterId: byChapterId,
              byJuzId: byJuzId,
              chapterId: chapterId,
              juzId: chapterId,
              versesCount: versesCount,
            );
          }
          print('dataFetched');
        }
      } else if (byJuzId!) {
        var verse = await ApiService.fetchVersesbyJuzId(juzId!);
        if (verse != null) {
          verseList.assignAll(verse);
          print('dataFetched');
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
