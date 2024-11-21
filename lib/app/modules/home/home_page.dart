import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/home/home_controller.dart';
import 'package:app_demo/app/modules/home/widgets/custom_drawer_button_widget.dart';
import 'package:app_demo/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:app_demo/app/widgets/custom_button_language_widget.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HomePage extends GetView {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  final HomeController controller = Get.put(HomeController());

  final List<Widget> screens = [];

  @override
  Widget build(BuildContext context) {
    var renderBox =
        _scaffoldKey.currentContext?.findRenderObject() as RenderBox?;
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: TDNavBar(
        useDefaultBack: false,
        // titleWidget: TDImage(
        //   assetUrl: 'assets/images/github.png',
        // ),
        leftBarItems: [
          TDNavBarItem(
            iconWidget: const TDAvatar(
              size: TDAvatarSize.medium,
              type: TDAvatarType.normal,
              defaultUrl: 'assets/images/github.png',
            ),
            action: () {
              TDToast.showText("点击图标", context: context);
            },
          ),
        ],
        title: '首页',
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(0),
            child: const Center(
              child: Text("Home"),
            ),
          )),
          // SafeArea(
          //     child: Obx(() => Container(
          //           color: Colors.red,
          //           padding: EdgeInsets.all(0),
          //           child: this.screens[controller.screen],
          //         )),
          //         ),
          Positioned(
            top: 8,
            left: 5,
            child: SafeArea(
              child: CustomDrawerButtonWidget(
                  callback: () => _scaffoldKey.currentState?.openDrawer()
                  // callback: () => TDDrawer(
                  //       context,
                  //       visible: true,
                  //       drawerTop: renderBox?.size.height,
                  //       items: List.generate(
                  //               30, (index) => TDDrawerItem(title: '菜单$index'))
                  //           .toList(),
                  //       onItemClick: (index, item) {
                  //         print(
                  //             'drawer item被点击，index：$index，title：${item.title}');
                  //       },
                  //     )
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
