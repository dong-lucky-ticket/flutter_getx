
import 'package:app_demo/app/modules/home/home_binding.dart';
import 'package:app_demo/app/modules/home/home_page.dart';
import 'package:app_demo/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> SplashPage(),),
    GetPage(name: Routes.HOME, binding: HomeBinding(), page:()=> HomePage(),),
  ];
}