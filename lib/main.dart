import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:led_banner/controllers/dashboard_bindings.dart';
import 'package:led_banner/localization_service.dart';
import 'package:led_banner/pages/splash_page.dart';
import 'package:led_banner/utils/utils.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: locales.contains(window.locale) ? window.locale : Locale('en', 'US'),
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        title: "Led Banner",
        initialBinding: DashboardBinding(),
        home: SplashPage(),
      ),
    );
  }
}