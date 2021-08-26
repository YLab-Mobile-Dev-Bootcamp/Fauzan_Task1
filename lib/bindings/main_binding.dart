import 'package:get/get.dart';
import 'package:starter_project/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
