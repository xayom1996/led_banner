import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:led_banner/controllers/dashboard_bindings.dart';
import 'package:led_banner/controllers/main_bindings.dart';
import 'package:led_banner/pages/dashboard_page.dart';
import 'package:led_banner/pages/splash_page.dart';

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
        title: "Led Banner",
        initialBinding: DashboardBinding(),
        home: SplashPage(),
      ),
    );
  }
}