import 'package:flutter/material.dart';

import 'package:flutter_getx/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:getwidget/getwidget.dart';

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
      appBar: GFAppBar(
        backgroundColor: GFColors.DARK,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: const GFAvatar(
              backgroundImage: AssetImage('assets/images/avatar_girl.png'),
            ),
          ),
        ),
        title: const Text(
          '账单',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed('/add');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: accountList.length,
          itemBuilder: (BuildContext context, int index) {
            return GFCard(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              content: GFListTile(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                avatar: const GFAvatar(
                  backgroundImage:
                      AssetImage('assets/images/avatar_girl.png'),
                ),
                titleText: accountList[index]?.recordDate,
                subTitleText:
                    accountList[index]?.money.toString(),
                icon: const Icon(Icons.favorite)),
            );
          }
        )
    );
  }
}
