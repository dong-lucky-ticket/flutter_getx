import 'package:flutter/material.dart';
import 'package:app_demo/app/modules/apresentacao/widgets/item_list_widget.dart';
import 'package:app_demo/app/theme/app_colors.dart';
import 'package:app_demo/app/theme/app_text_theme.dart';
import 'package:app_demo/app/widgets/custom_title_widget.dart';
import 'package:app_demo/app/widgets/previous_next_widget.dart';
import 'package:get/get.dart';


class ApresentacaoPage extends StatelessWidget {
  const ApresentacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleWidget(
              title: 'getx_pattern'.tr,
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'getx_a_proposal_for_you'.tr,
                    style: textContent,
                  ),
                  CustomTitleWidget(title: 'objective'.tr),
                  Text(
                    'getx_the_main_objective'.tr,
                    style: textContent,
                  ),
                  // Text(
                  //   'The main objective, is to make your programming with Flutter + GetX more pleasant and intuitive than it already is! When there is a development pattern to be followed, everything is easier for those who use it.',
                  //   style: textContent,
                  // ),

                  Text('but_why'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: spotlightColor,
                          fontSize: 20))
                ],
              ),
            ),
            ItemListWidget(
              text: 'getx_because_that_way'.tr,
              color: spotlightColor,
            ),
            ItemListWidget(
                text: 'getx_there_are_infinite_ways'.tr, color: softBlue),
            ItemListWidget(
              text: 'getx_this_makes_it_much_easier'.tr,
              color: spotlightColor,
            ),
            ItemListWidget(
              text: 'getx_your_project_will_not_be_dependent'.tr,
              color: softBlue,
            ),
            ItemListWidget(
                text: 'getx_you_will_have_a_better_use'.tr,
                color: spotlightColor),
            ItemListWidget(
              text: 'getx_that_you_can_apply_the_use',
              color: softBlue,
            ),
            CustomNextPrevious()
          ],
        ),
      ),
    ));
  }
}
