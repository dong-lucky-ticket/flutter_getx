import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_app_bar.dart';

import '../statistics/statistics_page.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('新增1234'),
        centerTitle: true,
        
      ),
      body: Column(
        children: [
          CustomAppBar(
            title: 'Icon(Icons.arrow_back)Icon(Icons.arrow_back)'
          ),
          Text("data"),
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