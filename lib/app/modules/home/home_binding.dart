import 'package:flutter_getx/app/data/provider/account.dart';
import 'package:flutter_getx/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountProvider>(() => AccountProvider());
    Get.lazyPut(()=> HomeController(provider: Get.find()));
  }
}
