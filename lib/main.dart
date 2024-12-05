import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:app_demo/app/routes/app_pages.dart';
import 'package:app_demo/app/theme/app_theme.dart';
import 'package:app_demo/app/translations/app_translations.dart';
import 'package:intl/intl.dart';

import 'app/modules/splash/splash_page.dart';

void main() async {
  await GetStorage.init();
  Intl.defaultLocale = 'en';
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    home: SplashPage(),

    translationsKeys: AppTranslation.translations,
    // translations: AppTranslation(),
    // translationsKeys: AppTranslation().keys,

    getPages: AppPages.pages,
    theme: appThemeData,
    // locale: Locale('es', 'MX'),
    locale: Locale('en', 'US'),
    fallbackLocale: Locale('en', 'US'),

    defaultTransition: Transition.rightToLeftWithFade,
  ));
}
