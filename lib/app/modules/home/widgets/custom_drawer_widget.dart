import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/home/home_controller.dart';
import 'package:app_demo/app/modules/home/widgets/custom_drawer_header_widget.dart';
import 'package:app_demo/app/modules/home/widgets/custom_item_drawer_widget.dart';
import 'package:app_demo/app/theme/app_colors.dart';
import 'package:app_demo/app/widgets/custom_icons_link_widget.dart';
import 'package:get/get.dart';

class CustomDrawer extends GetView {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          key: Key('container-drawer'),
          height: Get.height -70,
          width: 300,
          child: Drawer(
            child: Container(
                height: Get.height,
                margin: EdgeInsets.only(bottom: 50),
                child: ListView.separated(
                  itemCount: controller.topics.length + 1,
                  separatorBuilder: (context, index) => index > 0
                      ? Divider(
                          height: 2,
                          color: spotlightColor,
                          indent: 2,
                          endIndent: 80,
                        )
                      : Container(),
                  itemBuilder: (c, i) {
                    return i == 0
                        ? CustomDrawerHeaderWidget()
                        : CustomItemDrawer(
                            text: controller.topics[i - 1],
                            index: i - 1,
                          );
                  },
                )),
          ),
        ),
        CustomIconsLinks()
      ],
    );
  }
}
