import 'package:starter_project/product/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:starter_project/chapter/model/chapter_model.dart';

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
        .get(Uri.parse('https://api.quran.com/api/v4/chapters?language=en'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return chapterListFromJson(jsonString).chapters;
    }
  }
}
