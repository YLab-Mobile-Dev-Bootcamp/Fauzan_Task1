import 'package:get/get.dart';
import 'package:starter_project/pages/account/account_binding.dart';
import 'package:starter_project/pages/account/account_page.dart';
import 'package:starter_project/pages/home/home_page.dart';
import 'package:starter_project/pages/home/home_binding.dart';
import 'package:starter_project/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.ACCOUNT,
      page: () => AccountPage(),
      binding: AccountBinding(),
    ),
  ];
}
