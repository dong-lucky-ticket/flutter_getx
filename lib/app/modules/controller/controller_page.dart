import 'package:flutter/material.dart';

import 'package:app_demo/app/modules/apresentacao/widgets/item_list_widget.dart';
import 'package:app_demo/app/theme/app_colors.dart';
import 'package:app_demo/app/theme/app_text_theme.dart';
import 'package:app_demo/app/widgets/custom_title_widget.dart';
import 'package:get/get.dart';

class ControllerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('ControllerPage')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleWidget(
                title: 'Controller',
              ),
              Container(
                width: Get.width,
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'This all about spearting things using controller',
                      style: textContent,
                    ),
                    CustomTitleWidget(title: 'Objective'),
                    Text(
                      'The main object, is to seperate business Logic from the Views',
                      style: textContent,
                    ),
                    Text(
                      ' But why?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: spotlightColor,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
              ItemListWidget(
                text:
                    'Becuase when we are creating a project we want to divide logic in differnt files',
                color: softBlue,
              ),
              ItemListWidget(
                text:
                    'Becuase when we are creating a project we want to divide logic in differnt files',
                color: spotlightColor,
              ),
              ItemListWidget(
                text:
                    'Becuase when we are creating a project we want to divide logic in differnt files',
                color: softBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
