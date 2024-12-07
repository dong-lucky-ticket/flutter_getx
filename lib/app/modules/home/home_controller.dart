import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  List<String> topics = [
    'Home'.tr,
    'Structure'.tr,
    'GetX'.tr,
    'Data'.tr,
    'Provider'.tr,
    'Model'.tr,
    'Repository'.tr,
    'Controller'.tr,
    'Bindings'.tr,
    'UI'.tr,
    'Rotas'.tr,
    'Translations'.tr,
    'Tutoriais'.tr,
  ];
  final box = GetStorage();

  final _themeIsDark = false.obs;
  get themeIsDark => _themeIsDark.value;
  set themeIsDark(value) => _themeIsDark.value = value;

  void refreshTopics() {
    topics = [
      'Home'.tr,
      'Structure'.tr,
      'GetX'.tr,
      'Data'.tr,
      'Provider'.tr,
      'Model'.tr,
      'Repository'.tr,
      'Controller'.tr,
      'Bindings'.tr,
      'UI'.tr,
      'Rotas'.tr,
      'Translations'.tr,
      'Tutoriais'.tr,
    ];
  }

  @override
  onInit() {
    super.onInit();
    box.writeIfNull('key', false);
    themeIsDark = box.read('key');
  }

  @override
  void onReady() {
    changeTheme();
    super.onReady();
  }

  final _screen = 0.obs;
  get screen => _screen.value;
  set screen(value) => _screen.value = value;

  changeTheme() async {
    Get.changeTheme(
        themeIsDark == false ? ThemeData.light() : ThemeData.dark());
    box.write('key', themeIsDark);
    themeIsDark = !themeIsDark;
  }

  final _lang = 'en-US'.obs;
  String get lang => _lang.value;
  set lang(value) => _lang.value = value;

  changeLanguage(lang) {
    lang = lang;
    if (lang == 'pt-BR') {
      Get.updateLocale(const Locale('pt', 'BR'));
    } else if (lang == 'en-US') {
      Get.updateLocale(const Locale('en', 'US'));
    } else if (lang == 'es-MX') {
      Get.updateLocale(const Locale('es', 'MX'));
    }
    refreshTopics();
    print('> local , lang = ${Get.locale} , $lang');
    print('>> GetX , oi = ' + 'GetX'.tr + ' , ' + 'oi'.tr);
  }

  nextPage() => screen < topics.length ? screen++ : null;
  previousPage() => screen > 0 ? screen-- : null;
}
