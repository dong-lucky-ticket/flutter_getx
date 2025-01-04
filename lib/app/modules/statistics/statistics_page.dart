import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/home/widgets/custom_app_bar.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Statistics',
      ),
      body: const Center(
        child: Text('Statistics Page'),
      )
    );
  }
}