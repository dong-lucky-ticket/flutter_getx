import 'package:flutter/material.dart';

import 'package:flutter_getx/app/modules/home/home_controller.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
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
      ),
      body: Obx(
        () {
          return ListView.builder(
              itemCount: controller.accountList.length,
              itemBuilder: (BuildContext context, int index) {
                return GFListTile(
                    avatar: const GFAvatar(
                      backgroundImage:
                          AssetImage('assets/images/avatar_girl.png'),
                    ),
                    titleText: controller.accountList[index]?.recordDate,
                    subTitleText:
                        controller.accountList[index]?.money.toString(),
                    icon: const Icon(Icons.favorite));
              });
        },
      ),
    );
  }
}
