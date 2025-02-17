import 'package:flutter/material.dart';

import 'package:flutter_getx/app/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/modules/home/home_page.dart';
// ignore: unused_import
import 'app/modules/splash/splash_page.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: const SplashPage(),
    home: const HomePage(),

    theme: appThemeData,
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('zh', 'CN'),
    ],
  ));
}

