import 'package:flutter/material.dart';

import 'package:flutter_getx/app/theme/app_colors.dart';
import 'package:flutter_getx/app/widgets/custom_icon_widget.dart';
import 'package:get/get.dart';

class CustomIconsLinks extends StatelessWidget {
  final List<String> imagesUrl = [
    'assets/images/dart.png',
    'assets/images/github.png',
    'assets/images/telegram.png',
    'assets/images/microsoft.png',
  ];

   CustomIconsLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 70,
        color: Get.isDarkMode ? spotlightColor : softBlue,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded( flex: 2,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesUrl.length,
                    itemBuilder: (c, i) {
                      return CustomIconWidget(url: imagesUrl[i]);
                    }),
              )
            ]));
  }
}
