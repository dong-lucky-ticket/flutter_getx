import 'package:flutter/material.dart';

import 'package:flutter_getx/app/theme/app_colors.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomItemDrawer extends StatelessWidget {
  final String text;
  final int index;
  const CustomItemDrawer({super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: spotlightColor,
      highlightColor: spotlightColor,
      splashColor: softBlue,
      onTap: () {
        TDToast.showText(text, context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
