import 'package:flutter_getx/app/data/model/account.dart';
import 'package:flutter_getx/app/data/provider/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get_storage/get_storage.dart';

// https://segmentfault.com/a/1190000039902160
// StateMixin参考智障轻言‘getx model实例如何定...’
class HomeController extends GetxController with StateMixin<AccountModal> {

  final AccountProvider provider;
  HomeController({required this.provider});

  final Rx<AccountModal?> _account = Rx(null);
  get account => _account.value;
  set account(value) => _account.value = value;
  final RxList<AccountModal?> _accountList = RxList([]);
  get accountList => _accountList;
  set accountList(value) => _accountList.value = value;
  

  // 拉取新闻列表
  Future<void> getList() async {
    final res = await provider.getList();

    accountList = res.result?.data ?? [];
    update();
  }
  // 拉取新闻列表
  Future<void> getDetail() async {
    final res = await provider.getDetail();

    account = res.result;
    update();
  }

  List<String> topics = [
    '家庭账单',
    '设置',
    '使用帮助',
    '意见反馈',
    '关于',
  ];
  // final box = GetStorage();

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
    // box.writeIfNull('key', false);
    // themeIsDark = box.read('key');
    getList();
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
    // box.write('key', themeIsDark);
    themeIsDark = !themeIsDark;
  }

}
