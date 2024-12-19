import 'package:flutter/material.dart';

import 'package:flutter_getx/app/modules/home/home_controller.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
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
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {

          return Obx(() {

            return GFListTile(
              avatar:GFAvatar(),
              titleText: controller.accountList[index]?.recordDate,
              subTitleText:controller.accountList[index]?.money.toString(),
              icon: Icon(Icons.favorite)
            );



            // return TDCollapse(
            //   style: TDCollapseStyle.block,
            //   expansionCallback: (int index, bool isExpanded) {
            //     // setState(() {
            //     //   _basicData[index].isExpanded = !isExpanded;
            //     // });
            //   },
            //   children: controller.accountList.map<TDCollapsePanel>((item) {
            //     return TDCollapsePanel(
            //       headerBuilder: (BuildContext context, bool isExpanded) {
            //         return Text('${item.recordDate}');
            //       },
            //       isExpanded: true,
            //       body: Text(item.money.toString()),
            //     );
            //   }).toList(),
            // );
          });
        },
      ),
    );
  }
}
