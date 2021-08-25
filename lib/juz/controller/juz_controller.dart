import 'package:get/get.dart';
import 'package:starter_project/api/api_service.dart';
import 'package:starter_project/juz/model/juz_model.dart';

class JuzController extends GetxController {
  var isLoading = true.obs;
  var juzList = <JuzModel>[].obs;

  @override
  void onInit() {
    fetchJuzs();
    super.onInit();
  }

  void fetchJuzs() async {
    try {
      isLoading(true);
      var juz = await ApiService.fetchJuzs();
      if (juz != null) {
        juzList.assignAll(juz);
      }
    } finally {
      isLoading(false);
    }
  }
}
