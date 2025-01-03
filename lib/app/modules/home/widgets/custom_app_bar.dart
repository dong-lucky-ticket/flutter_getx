import 'package:flutter/material.dart';

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
class CustomAppBar extends StatefulWidget {
  final Widget? leading;

  const CustomAppBar({super.key, this.leading});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        // color: appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        height: kToolbarHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // 阴影颜色
              spreadRadius: 5, // 扩展半径
              blurRadius: 7, // 模糊半径
              offset: const Offset(0, 4), // 水平和垂直方向的偏移量
            ),
          ],
        ),
        child: widget.leading,
      ),
    );
  }
}
