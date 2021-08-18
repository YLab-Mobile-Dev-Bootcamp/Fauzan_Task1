import 'package:get/instance_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:starter_project/pages/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<HomeController>(() => HomeController())
  }
}