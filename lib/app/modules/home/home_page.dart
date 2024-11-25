import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/home/home_controller.dart';
import 'package:app_demo/app/modules/home/widgets/custom_drawer_button_widget.dart';
import 'package:app_demo/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:app_demo/app/widgets/custom_button_language_widget.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  final HomeController controller = Get.put(HomeController());

  final List<Widget> screens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: CircleAvatar(
            foregroundColor: Colors.red,
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Image.asset(
                'assets/images/avatar_girl.png',
                width: 32,
                height: 32,
              ),
            ),
          ),
        ),
        title: const Text('首页'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(0),
            child: Center(
              child: Container(
                color: Colors.amberAccent,
                width: 32,
                height: 32,
                child: CircleAvatar(
                  radius: 32, // 设置头像的半径为11
                  foregroundColor: Colors.red,
                  child: Image.asset(
                    'assets/images/github.png',
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
            ),
          )),
          Positioned(
            top: 8,
            left: 5,
            child: SafeArea(
              child: CustomDrawerButtonWidget(
                  callback: () => _scaffoldKey.currentState?.openDrawer()
                  ),
            ),
          ),
          Positioned(
            top: 8,
            right: 5,
            child: SafeArea(child: CustomSelectLanguageWidget()),
          ),
        ],
      ),
    );
  }
}
