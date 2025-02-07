// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_app_bar.dart';
import 'package:flutter_getx/app/widgets/font_icon.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  TypeIcons? activeTypeIcons;

  bool isBillDetailsVisible = false;

  @override
  Widget build(BuildContext context) {
    const typeValues = TypeIcons.values;
    return Scaffold(
        appBar: CustomAppBar(
            titleWidget: TabBar(
          isScrollable: true,
          // indicator: CustomTabIndicator(),
          indicatorSize: TabBarIndicatorSize.label,
          controller: controller,
          tabs: const [
            Tab(
              text: '收入',
            ),
            Tab(
              text: '支出',
            )
          ],
        )),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, // 每行的列数
                      crossAxisSpacing: 10, // 列与列之间的间隔
                      mainAxisSpacing: 10, // 行与行之间的间隔
                    ),
                    itemCount: typeValues.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            activeTypeIcons = typeValues[index];
                            isBillDetailsVisible = true;
                          });
                          // 获取点击的图标在GridView中的位置
                          final RenderBox renderBox =
                              context.findRenderObject() as RenderBox;
                          final position = renderBox.localToGlobal(Offset.zero);
                          final scrollController = ScrollController();

                          // 计算点击的图标是否在可视区域下方
                          if (position.dy >
                              MediaQuery.of(context).size.height * 0.5) {
                            // 滚动到点击的图标位置
                            scrollController.animateTo(
                              position.dy -
                                  MediaQuery.of(context).size.height * 0.5,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: activeTypeIcons == typeValues[index]
                                ? Colors.lightBlueAccent
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(typeValues[index].icon),
                              Text(
                                typeValues[index].title,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            if (isBillDetailsVisible)
              AnimatedOpacity(
                opacity: isBillDetailsVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  color: Colors.black.withOpacity(0.5), // 半透明背景
                  child: Center(
                    child: Container(
                      height: 300, // 模态框的高度
                      width: 300, // 模态框的宽度
                      color: Colors.red,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('这是一个从底部弹出的模态框'),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isBillDetailsVisible = false;
                                });
                              },
                              child: Text('关闭'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}

// 自定义指示器
class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomBoxPainter();
  }
}

class _CustomBoxPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = Colors.white // 指示器颜色
      ..style = PaintingStyle.fill;

    // 指示器宽度
    const double indicatorHeight = 4.0;
    final double indicatorWidth = configuration.size!.width * 0.2;

    // 计算指示器的绘制位置
    final Offset indicatorOffset = Offset(
      offset.dx + (configuration.size!.width - indicatorWidth) / 2,
      configuration.size!.height - indicatorHeight,
    );

    final Rect indicatorRect = Rect.fromLTWH(
      indicatorOffset.dx,
      indicatorOffset.dy,
      indicatorWidth,
      indicatorHeight,
    );

    // 绘制圆角矩形作为指示器
    final RRect roundedRect = RRect.fromRectAndRadius(
      indicatorRect,
      const Radius.circular(4.0),
    );

    canvas.drawRRect(roundedRect, paint);
  }
}
