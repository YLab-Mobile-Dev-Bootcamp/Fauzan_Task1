import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starter_project/routes/app_pages.dart';

class LoadAuthController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    googleSignIn = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      //to main page
      Get.offAllNamed(Routes.MAIN, arguments: firebaseAuth.currentUser);
    } else {
      // to login page
      Get.offAllNamed(
        Routes.LOGIN,
      );
    }
  }
}
