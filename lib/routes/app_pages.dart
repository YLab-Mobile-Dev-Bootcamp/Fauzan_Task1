import 'package:get/get.dart';
import 'package:starter_project/bindings/load_auth_binding.dart';
import 'package:starter_project/bindings/login_binding.dart';
import 'package:starter_project/bindings/main_binding.dart';
import 'package:starter_project/views/load_auth_page.dart';
import 'package:starter_project/views/login_page.dart';
import 'package:starter_project/views/main_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOAD_AUTH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOAD_AUTH,
      page: () => LoadAuthPage(),
      binding: LoadAuthBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
  ];
}
