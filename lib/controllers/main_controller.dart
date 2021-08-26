import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:starter_project/controllers/load_auth_controller.dart';

class MainController extends GetxController {
  LoadAuthController loadAuthController = Get.find<LoadAuthController>();
  late User user;

  @override
  void onInit() async {
    super.onInit();
    user = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() async {
    await loadAuthController.googleSignIn.disconnect();
    await loadAuthController.firebaseAuth.signOut();
  }
}
