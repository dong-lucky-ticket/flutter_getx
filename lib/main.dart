import 'package:flutter/material.dart';

import 'package:flutter_getx/app/theme/app_theme.dart';
import 'package:intl/intl.dart';

import 'app/modules/home/home_page.dart';
// ignore: unused_import
import 'app/modules/splash/splash_page.dart';

void main() async {
  Intl.defaultLocale = 'en';
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: const SplashPage(),
    home: const HomePage(),

    theme: appThemeData,
    locale: const Locale('en', 'US'),
  ));
}

