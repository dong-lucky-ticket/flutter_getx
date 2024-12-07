import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/estrutura/estrutura_controller.dart';
import 'package:app_demo/app/theme/app_colors.dart';
import 'package:app_demo/app/theme/app_text_theme.dart';
import 'package:app_demo/app/widgets/custom_title_widget.dart';
import 'package:app_demo/app/widgets/previous_next_widget.dart';
import 'package:get/get.dart';

class EstruturaPage extends StatelessWidget {
  final EstruturaController controller = Get.put(EstruturaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitleWidget(
                        title: 'Structure',
                      ),
                      Container(
                        margin: EdgeInsets.all(16.0),
                      ),
                      Text(
                        'structure_you_can_feel_free_to_use'.tr,
                        style: textContent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'structure_first_lets_take_a_look'.tr,
                          style: textContent,
                        ),
                      ),
                      Obx(
                        () => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(controller.structureType(),
                                    style: TextStyle(
                                        color: softBlue, fontSize: 18)),
                                IconButton(
                                    icon: Icon(
                                      Icons.touch_app,
                                      color: spotlightColor,
                                    ),
                                    onPressed: null),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => controller.changeStructure(),
                              child: Container(
                                alignment: Alignment.center,
                                height: 300,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(controller
                                          .strc[controller.structure])),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'structure_Now_that_you_know_the'.tr,
                        style: textContent,
                      ),
                      CustomTitleWidget(
                        title: 'Model',
                      ),
                      Center(
                        child: Text(
                          'structure_It_is_the_directory_that_will'.tr,
                          style: textContent,
                        ),
                      ),
                      CustomTitleWidget(
                        title: 'Provider',
                      ),
                      Center(
                        child: Text(
                          'structure_It_is_the_directory_responsible_for'.tr,
                          style: textContent,
                        ),
                      ),
                      CustomTitleWidget(
                        title: 'Repository',
                      ),
                      Center(
                        child: Text(
                          'structure_It_is_a_single_point_of_access'.tr,
                          style: textContent,
                        ),
                      ),
                      CustomTitleWidget(
                        title: 'Data',
                      ),
                      Center(
                        child: Text(
                          'structure_It_is_the_directory_that_will_group_all'
                              .tr,
                          style: textContent,
                        ),
                      ),
                      CustomTitleWidget(
                        title: 'Controller',
                      ),
                      Center(
                        child: Container(
                          width: Get.width / 1.2,
                          child: Text(
                            'structure_Our_controllers_are_nothing_more_than'
                                .tr,
                            style: textContent,
                          ),
                        ),
                      ),
                      CustomTitleWidget(
                        title: 'UI',
                      ),
                      Center(
                        child: Text(
                          'É tudo que o usuário vê, seus widgets, animações, textos, temas.'
                              .tr,
                          style: textContent,
                        ),
                      ),
                      CustomTitleWidget(
                        title: 'Routes',
                      ),
                      Center(
                        child: Text(
                          'structure_It_is_the_directory_responsible_for_containing_our_files_which'
                              .tr,
                          style: textContent,
                        ),
                      ),
                      CustomTitleWidget(
                        title: 'Translations',
                      ),
                      Center(
                        child: Text(
                          'structure_translation_info'.tr,
                          style: textContent,
                        ),
                      ),
                      CustomTitleWidget(
                        title: 'Bindings',
                      ),
                      Center(
                        child: Text(
                          'structure_bindings_info'.tr,
                          style: textContent,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'structure_Now_that_you_know_a_little_more_about_our_structure'
                                .tr,
                            style: textContent,
                          )),
                      CustomNextPrevious()
                    ]))));
  }
}
