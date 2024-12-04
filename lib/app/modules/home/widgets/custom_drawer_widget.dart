import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/home/home_controller.dart';
import 'package:app_demo/app/modules/home/widgets/custom_drawer_header_widget.dart';
import 'package:app_demo/app/modules/home/widgets/custom_item_drawer_widget.dart';
import 'package:app_demo/app/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomDrawer extends GetView {
  CustomDrawer({super.key});

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
                    separatorBuilder: (context, index) => const Divider(
                      height: 2,
                      color: lightGrey,
                      indent: 12,
                      endIndent: 12,
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
              // CustomIconsLinks()
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TDButton(
                  text: '放个按钮',
                  size: TDButtonSize.large,
                  type: TDButtonType.fill,
                  shape: TDButtonShape.rectangle,
                  theme: TDButtonTheme.primary,
                  isBlock: true,
                  onTap: () {
                    TDToast.showText('还没想好做什么，先放这儿', context: context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
