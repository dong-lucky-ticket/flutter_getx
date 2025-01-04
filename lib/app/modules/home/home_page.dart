import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/create/create_page.dart';

import 'package:flutter_getx/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:flutter_getx/app/modules/statistics/statistics_page.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../data/model/account.dart';
import '../../data/provider/account.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AccountModal account;
  late List<AccountModal?> accountList = [];

  // 拉取新闻列表
  Future<void> getList() async {
    final res = await AccountProvider.getList();
    setState(() {
      accountList = res.result?.data ?? [];
    });
  }

  // 拉取新闻列表
  Future<void> getDetail() async {
    final res = await AccountProvider.getDetail();

    setState(() {
      account = res.result!;
    });
  }

  @override
  void initState() {
    getList();
    getDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/avatar_girl.png',
                width: 32,
                height: 32,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StatisticsPage()));
                },
                icon: const Icon(Icons.bar_chart))
          ],
        ),
        // appBar: TDNavBar(
        //     useDefaultBack: false,
        //     centerTitle: false,
        //     titleMargin: 0,
        //     titleWidget: GestureDetector(
        //       onTap: () {
        //         _scaffoldKey.currentState?.openDrawer();
        //       },
        //       child: const TDImage(
        //         assetUrl: 'assets/images/avatar_girl.png',
        //         width: 32,
        //         height: 32,
        //       ),
        //     ),
        //     rightBarItems: [
        //       TDNavBarItem(icon: TDIcons.home, iconSize: 24),
        //       TDNavBarItem(icon: TDIcons.ellipsis, iconSize: 24)
        //     ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreatePage()));
          },
          child: const Icon(Icons.add),
        ),
        // body: TDCellGroup(
        //    cells: [
        //     TDCell(arrow: true, title: '单行标题'),
        //     TDCell(arrow: true, title: '单行标题', required: true),
        //     TDCell(arrow: true, title: '单行标题', noteWidget: TDBadge(TDBadgeType.message, count: '8')),
        //     TDCell(arrow: false, title: '单行标题', rightIconWidget: TDSwitch(isOn: true)),
        //     TDCell(arrow: true, title: '单行标题', note: '辅助信息'),
        //     TDCell(arrow: true, title: '单行标题', leftIcon: TDIcons.lock_on),
        //     TDCell(arrow: false, title: '单行标题'),
        //   ],
        // ),
        body: ListView.builder(
            itemCount: accountList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TDCell(
                    arrow: false,
                    title: accountList[index]?.recordDate,
                    rightIconWidget: Text(
                      accountList[index]?.money.toString() ?? "",
                    )),
              );
              // return GFCard(
              //   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              //   content: GFListTile(
              //     padding: const EdgeInsets.all(0),
              //     margin: const EdgeInsets.all(0),
              //     avatar: const GFAvatar(
              //       backgroundImage:
              //           AssetImage('assets/images/avatar_girl.png'),
              //     ),
              //     titleText: accountList[index]?.recordDate,
              //     subTitleText:
              //         accountList[index]?.money.toString(),
              //     icon: const Icon(Icons.favorite)),
              // );
            }));
  }
}
