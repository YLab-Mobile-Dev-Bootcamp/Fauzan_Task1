import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starter_project/controllers/load_auth_controller.dart';
import 'package:starter_project/views/custom_load_dialog.dart';

class LoginController extends GetxController {
  LoadAuthController loadAuthController = Get.find<LoadAuthController>();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void login() async {
    CustomLoadDialog.showDialog();
    GoogleSignInAccount? googleSignInAccount =
        await loadAuthController.googleSignIn.signIn();
    if (googleSignInAccount == null) {
      CustomLoadDialog.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await loadAuthController.firebaseAuth
          .signInWithCredential(oAuthCredential);
      CustomLoadDialog.cancelDialog();
    }
  }
}
