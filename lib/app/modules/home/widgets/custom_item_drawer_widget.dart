import 'package:flutter/material.dart';

import 'package:flutter_getx/app/modules/home/home_controller.dart';
import 'package:flutter_getx/app/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomItemDrawer extends GetView {
  final String text;
  final int index;
  CustomItemDrawer({super.key, required this.text, required this.index});

  @override
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Get.isDarkMode ? softBlue : spotlightColor,
      highlightColor: Get.isDarkMode ? softBlue : spotlightColor,
      splashColor: Get.isDarkMode ? spotlightColor : softBlue,
      onTap: () {
        // controller.screen = index ;
        // Scaffold.of(context).openEndDrawer();
        TDToast.showText(text, context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
