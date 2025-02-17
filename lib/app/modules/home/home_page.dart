import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/create/create_page.dart';

import 'package:flutter_getx/app/modules/home/widgets/custom_drawer_widget.dart';
import 'package:flutter_getx/app/modules/statistics/statistics_page.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../data/model/account.dart';
import '../../data/provider/account.dart';
import '../expense_entry/expense_entry.dart';

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
    // getDetail();
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
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const StatisticsPage()));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpenseEntryPage(),
                  ),
                );
              },
              icon: const Icon(Icons.bar_chart),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const CreatePage()));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreatePage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
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
            }));
  }
}
