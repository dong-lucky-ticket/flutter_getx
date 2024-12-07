import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/home/widgets/custom_theme_button_widget.dart';
import 'package:app_demo/app/theme/app_colors.dart';
import 'package:get/get.dart';

class CustomDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(
        width: 200,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rocket_minimal.png'))),
              ),
              Text(
                'GetX_Pattern'.tr,
                style: TextStyle(fontSize: 24, color: spotlightColor),
              ),
              Container(child: CustomSwitchWidget()),
            ]),
            Text(
              'Project_using_GetX_Library'.tr,
              style: TextStyle(fontSize: 16, color: softBlue),
            ),
          ],
        ),
      ),
    );
  }
}
