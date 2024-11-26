import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/home/widgets/custom_theme_button_widget.dart';
import 'package:app_demo/app/theme/app_colors.dart';
import 'package:get/get.dart';

class CustomDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Container(
        color: Colors.redAccent,
        child: Row(
          children: [
            CircleAvatar(
              radius: 32, // 设置头像的半径为11
              child: Image.asset(
                'assets/images/avatar_girl.png',
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('自律的小码农',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode? Colors.white : Colors.black)),
                Text('攒钱的小码农',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode? Colors.white : Colors.black)),
              ],
            )
          ]
        ),
      ),
    );
  }
}
