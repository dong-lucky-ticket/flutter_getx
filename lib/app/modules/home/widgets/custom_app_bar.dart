import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final List<Widget>? actions;

  const CustomAppBar(
      {super.key, required this.title, this.height = kToolbarHeight, this.actions});

  @override
  Widget build(BuildContext context) {
    final Color appBarColor = Theme.of(context).appBarTheme.backgroundColor ??
        Theme.of(context).primaryColor;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final bool canGoBack = Navigator.canPop(context); // 检测是否可以返回

    return Material(
      color: appBarColor, // 设置背景颜色
      elevation: 4.0, // 添加底部阴影
      shadowColor: Colors.black, // 阴影颜色
      child: Container(
        height: height + statusBarHeight,
        padding: EdgeInsets.only(top: statusBarHeight),
        alignment: Alignment.center,
        child: Stack(
          children: [
            if (canGoBack)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(56, 48)),
                  ),
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.0),
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip, // 添加返回提示
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  splashRadius: 24.0, // 设置点击效果半径，与默认一致
                ),
              ),
            LayoutBuilder(
              builder: (context, constraints) {
                final double maxTitleWidth = constraints.maxWidth * 0.6; // 标题占最多 60% 的宽度
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxTitleWidth),
                    child: Text(
                      title,
                      style: Theme.of(context).appBarTheme.titleTextStyle ??
                          TextStyle(color: Colors.white, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, // 超出部分显示省略号
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
            // 右侧操作按钮
            if (actions != null)
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions!,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
