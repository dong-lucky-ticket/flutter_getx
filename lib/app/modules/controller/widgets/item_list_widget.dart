import 'package:flutter/material.dart';

import 'package:app_demo/app/theme/app_text_theme.dart';
import 'package:get/get.dart';

class ItemListWidget extends Container {
  final String text;
  final Color color;

  ItemListWidget({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: Get.width,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Icon(
                Icons.fiber_manual_record,
                color: this.color,
              )),
          Expanded(
            flex: 7,
            child: Text(
              this.text,
              style: textContent,
            ),
          )
        ],
      ),
    );
  }
}
