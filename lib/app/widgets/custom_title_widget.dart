import 'package:flutter/material.dart';
import 'package:flutter_getx/app/theme/app_text_theme.dart';
import 'package:get/get.dart';


class CustomTitleWidget extends Container {
  final String title;

  CustomTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.tr,
            style: titulo,
          ),
        ],
      ),
    );
  }
}
