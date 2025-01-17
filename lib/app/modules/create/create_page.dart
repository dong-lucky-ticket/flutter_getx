import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_app_bar.dart';
import 'package:flutter_getx/app/widgets/font_icon.dart';

import '../statistics/statistics_page.dart';

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

  @override
  Widget build(BuildContext context) {
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
      body: TabBarView(
        controller: controller,
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 每行的列数
              crossAxisSpacing: 10, // 列与列之间的间隔
              mainAxisSpacing: 10, // 行与行之间的间隔
            ),
            itemCount: 100,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  children: [
                    Icon(FontIcon.accounting),
                    Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      // body: SizedBox(
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      //   child: Column(
      //     children: [

      //       Expanded(
      //         child: TabBarView(
      //           children: [
      //             GridView.builder(
      //           padding: const EdgeInsets.all(10.0),
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 3, // 每行的列数
      //             crossAxisSpacing: 10, // 列与列之间的间隔
      //             mainAxisSpacing: 10, // 行与行之间的间隔
      //           ),
      //           itemCount: 100,
      //           itemBuilder: (context, index) {
      //             return Center(
      //               child: Text(
      //                 'Item $index',
      //                 style: Theme.of(context).textTheme.headline5,
      //               ),
      //             );
      //           },
      //         ),
      //             Container(
      //               color: Colors.blue,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
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
    final double indicatorHeight = 4.0;
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
      Radius.circular(4.0),
    );

    canvas.drawRRect(roundedRect, paint);
  }
}
