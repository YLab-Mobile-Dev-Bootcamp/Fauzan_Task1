import 'package:get/get.dart';
import 'package:starter_project/controllers/load_auth_controller.dart';

class LoadAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoadAuthController>(LoadAuthController());
  }
}
