import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/home/home_controller.dart';
import 'package:app_demo/app/theme/app_colors.dart';
import 'package:get/get.dart';

class CustomItemDrawer extends GetView {
  final String text;
  final int index;
  final HomeController controller = Get.find<HomeController>();
  CustomItemDrawer({super.key, required this.text, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Get.isDarkMode ? softBlue : spotlightColor,
      highlightColor: Get.isDarkMode ? softBlue : spotlightColor,
      splashColor: Get.isDarkMode ? spotlightColor : softBlue,
      onTap: () {
        controller.screen = index ;
        Scaffold.of(context).openEndDrawer();
      },
      child: Container(
          padding: EdgeInsets.all(16),
          child: Text(
            this.text,
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
