import 'package:flutter/material.dart';


class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({super.key});

  

  @override
  Widget build(BuildContext context) {
    return const Text('data');
    // return Obx(() => Switch(
    //       hoverColor: Colors.red,
    //       activeColor: Colors.black,
    //       inactiveThumbColor: spotlightColor,
    //       activeTrackColor: spotlightColor,
    //       inactiveTrackColor: softBlue,
    //       value: controller.themeIsDark,
    //       onChanged: (b) => controller.changeTheme(),
    //     ));
  }
}
