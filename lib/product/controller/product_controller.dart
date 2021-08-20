import 'package:get/get.dart';
import 'package:starter_project/api/api_service.dart';
import 'package:starter_project/product/model/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var product = await ApiService.fetchProducts();
      if (product != null) {
        productList.assignAll(product);
      }
    } finally {
      isLoading(false);
    }
  }
}
