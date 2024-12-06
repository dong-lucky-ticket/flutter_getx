// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app_demo/app/model/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    final jn = {
      "type": "支出",
      "recordDate": "2024-12-09",
      "money": -150.00,
      "desc": "购买办公用品",
      "category": "办公"
    };

    final acc = Account.fromJson(jn);

    final date = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse("2018-12-10T15:46:20.897228"));

    print(date);
    print(acc);
  });
}