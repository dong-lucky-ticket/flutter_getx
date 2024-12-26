import 'package:flutter/material.dart';

import 'package:flutter_getx/app/modules/home/widgets/custom_drawer_header_widget.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_item_drawer_widget.dart';
import 'package:flutter_getx/app/theme/app_colors.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

const List<String> topics = [
  '家庭账单',
  '设置',
  '使用帮助',
  '意见反馈',
  '关于',
];

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    itemCount: topics.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 2,
                      color: lightGrey,
                      indent: 12,
                      endIndent: 12,
                    ),
                    itemBuilder: (c, i) {
                      return CustomItemDrawer(
                        text: topics[i],
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
                  text: '填充按钮',
                  icon: TDIcons.app,
                  size: TDButtonSize.large,
                  type: TDButtonType.fill,
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
