import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:led_banner/pages/banner_page.dart';
import 'package:led_banner/pages/settings_page.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find(tag: 'dashboard');
  var tabIndex = 0.obs;
  List<Widget>? pages;

  @override
  void onInit(){
    pages = [
      SettingsPage(),
      BannerPage(),
      SettingsPage(),
    ];
    super.onInit();
  }

  Widget get currentPage => pages![tabIndex.value];

  void changeTabIndex(int index) async {
      tabIndex.value = index;
  }
}