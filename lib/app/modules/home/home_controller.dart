import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  List<String> topics = [
    '家庭账单',
    '设置',
    '使用帮助',
    '意见反馈',
    '关于',
  ];
  final box = GetStorage();

  final _themeIsDark = false.obs;
  get themeIsDark => _themeIsDark.value;
  set themeIsDark(value) => _themeIsDark.value = value;

  void refreshTopics() {
    topics = [
      '家庭账单',
      '设置',
      '使用帮助',
      '意见反馈',
      '关于',
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

}
