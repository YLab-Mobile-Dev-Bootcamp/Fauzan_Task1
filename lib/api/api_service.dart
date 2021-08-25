import 'package:starter_project/juz/model/juz_model.dart';
import 'package:starter_project/product/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:starter_project/chapter/model/chapter_model.dart';
import 'package:starter_project/verse/model/verse_model.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    }
  }

  static Future<List<ChapterModel>?> fetchChapters() async {
    var response = await client
        .get(Uri.parse('https://api.quran.com/api/v4/chapters?language=id'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return chapterListFromJson(jsonString).chapters;
    }
  }

  static Future<List<JuzModel>?> fetchJuzs() async {
    var response =
        await client.get(Uri.parse('https://api.quran.com/api/v4/juzs'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return juzListFromJson(jsonString).juzs;
    }
  }

  static Future<List<VerseModel>?> fetchVersesbyChapterId(int chapterId) async {
    var response = await client.get(Uri.parse(
        'https://api.quran.com/api/v4/verses/by_chapter/$chapterId?words=false&translations=33&fields=text_imlaei'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return verseListFromJson(jsonString).verses;
    }
  }

  static Future<List<VerseModel>?> fetchVersesbyJuzId(int juzId) async {
    var response = await client.get(Uri.parse(
        'https://api.quran.com/api/v4/verses/by_juz/$juzId?language=en&words=true'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return verseListFromJson(jsonString).verses;
    }
  }
}
