import 'package:flutter/material.dart';

import 'package:flutter_getx/app/modules/home/home_controller.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          leading: Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: CircleAvatar(
              foregroundColor: Colors.red,
              child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Image.asset(
                  'assets/images/avatar_girl.png',
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          ),
          title: const Text('首页'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: '全部'),
              Tab(text: '支出'),
              Tab(text: '收入'),
            ]
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return TDCollapse(
                  style: TDCollapseStyle.block,
                  expansionCallback: (int index, bool isExpanded) {
                    // setState(() {
                    //   _basicData[index].isExpanded = !isExpanded;
                    // });
                  },
                  children: [1, 2, 3].map((item) {
                    return TDCollapsePanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Text('账目$item');
                      },
                      isExpanded: true,
                      body: Obx(() {
                        return TDCellGroup(
                          cells: controller.accountList.map<TDCell>((item) {
                            return TDCell(
                              arrow: false,
                              title: item.category,
                              rightIconWidget: Text('¥ ${item.money.toString()}')
                            );
                          }).toList(),
                        );
                      })
                    );
                  }).toList(),
                );
              },
            ),
            ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {

                  return Obx(() {
                    return TDCollapse(
                      style: TDCollapseStyle.block,
                      expansionCallback: (int index, bool isExpanded) {
                        // setState(() {
                        //   _basicData[index].isExpanded = !isExpanded;
                        // });
                      },
                      children: controller.accountList.map<TDCollapsePanel>((item) {
                        return TDCollapsePanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return Text('${item.recordDate}');
                          },
                          isExpanded: true,
                          body: Text(item.money.toString()),
                        );
                      }).toList(),
                    );
                  });
                },
              ),
            
            // ListView.builder(
            //   itemCount: 25,
            //   itemBuilder: (BuildContext context, int index) {
            //     return TDCollapse(
            //       style: TDCollapseStyle.block,
            //       expansionCallback: (int index, bool isExpanded) {
            //         // setState(() {
            //         //   _basicData[index].isExpanded = !isExpanded;
            //         // });
            //       },
            //       children: [
            //         TDCollapsePanel(
            //           headerBuilder: (BuildContext context, bool isExpanded) {
            //             return const Text('2024-12-04');
            //           },
            //           isExpanded: false,
            //           body: const Text('randomString'),
            //         )
            //       ]
            //     );
            //   },
            // ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return TDCollapse(
                  style: TDCollapseStyle.block,
                  expansionCallback: (int index, bool isExpanded) {
                    // setState(() {
                    //   _basicData[index].isExpanded = !isExpanded;
                    // });
                    TDToast.showText('$index', context: context);
                    controller.getDetail();
                  },
                  children: [
                    TDCollapsePanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return const Text('2024-12-04');
                      },
                      isExpanded: true,
                      body: Obx(() {
                        return Text(controller.account?.money?.toString() ?? '0');
                      })
                      // body: const Column(
                      //   children: [
                      //     TDCell(arrow: false, title: '云厨房', rightIconWidget: Text('¥ 15.7')),
                      //     TDCell(arrow: false, title: 'KFC', rightIconWidget: Text('¥ 29.9')),
                      //     TDCell(arrow: false, title: '米粥', rightIconWidget: Text('¥ 0')),
                      //   ]
                      // ),
                    )
                  ]
                );
              },
            ),
            // ListView.builder(
            //   itemCount: 25,
            //   itemBuilder: (BuildContext context, int index) {
            //     return TDCollapse.accordion(children: [
            //       TDCollapsePanel(
            //         headerBuilder: (BuildContext context, bool isExpanded) {
            //           return const Text('2024-12-03');
            //         },
            //         isExpanded: false,
            //         body: const Text('randomString')
            //         // body: const Column(
            //         //   children: [
            //         //     TDCell(arrow: false, title: '云厨房', rightIconWidget: Text('¥ 15.7')),
            //         //     TDCell(arrow: false, title: 'KFC', rightIconWidget: Text('¥ 29.9')),
            //         //     TDCell(arrow: false, title: '米粥', rightIconWidget: Text('¥ 0')),
            //         //   ]
            //         // ),
            //       )
            //     ],);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
