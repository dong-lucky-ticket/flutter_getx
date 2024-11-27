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
    print(Get.height);
    return Drawer(
      child: Container(
        color: Colors.cyan[50],
        child: SafeArea(
          child: Column(
            children: [
              CustomDrawerHeaderWidget(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  margin: const EdgeInsets.all(16),
                  child: ListView.separated(
                    itemCount: controller.topics.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 2,
                      color: spotlightColor,
                      indent: 2,
                      endIndent: 80,
                    ),
                    itemBuilder: (c, i) {
                      return CustomItemDrawer(
                        text: controller.topics[i],
                        index: i,
                      );
                    },
                  ),
                ),
              ),
              CustomIconsLinks()
            ],
          ),
        ),
      ),
    );
  }
}
