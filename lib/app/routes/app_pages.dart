
import 'package:flutter_getx/app/modules/home/home_binding.dart';
import 'package:flutter_getx/app/modules/home/home_page.dart';
import 'package:flutter_getx/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> const SplashPage(),),
    GetPage(name: Routes.HOME, binding: HomeBinding(), page:()=> HomePage(),),
  ];
}