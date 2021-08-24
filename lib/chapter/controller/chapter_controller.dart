import 'package:get/get.dart';
import 'package:starter_project/api/api_service.dart';
import 'package:starter_project/chapter/model/chapter_model.dart';

class ChapterController extends GetxController {
  var isLoading = true.obs;
  var chapterList = <ChapterModel>[].obs;

  @override
  void onInit() {
    fetchChapters();
    super.onInit();
  }

  void fetchChapters() async {
    try {
      isLoading(true);
      var chapter = await ApiService.fetchChapters();
      if (chapter != null) {
        chapterList.assignAll(chapter);
      }
    } finally {
      isLoading(false);
    }
  }
}
