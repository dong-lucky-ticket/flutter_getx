import 'package:flutter/material.dart';

import 'package:flutter_getx/app/modules/home/widgets/custom_drawer_header_widget.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_item_drawer_widget.dart';
import 'package:flutter_getx/app/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../home_controller.dart';

class CustomDrawer extends GetView<HomeController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: Container(
        color: Colors.cyan[50],
        child: SafeArea(
          child: Column(
            children: [
              const CustomDrawerHeaderWidget(),
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
                child: GFButton(
                  text: '放个按钮',
                  blockButton: true,
                  onPressed: () {
                    GFToast.showToast('还没想好做什么，先放这儿', context);
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
