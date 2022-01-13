import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:led_banner/controllers/dashboard_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:led_banner/theme/color_theme.dart';
import 'package:led_banner/theme/text_theme.dart';


class DashboardPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find(tag: 'dashboard');

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Obx(() =>
              IndexedStack(
                key: const PageStorageKey('Indexed'),
                index: dashboardController.tabIndex.value,
                children: dashboardController.pages!,
              ),
          )
      ),
      bottomNavigationBar: MyNavBar(
          items: [
            {
              'iconPath': 'assets/icons/templates_icon.svg',
              'title': 'templates'.tr,
            },
            {
              'iconPath': 'assets/icons/edit_icon.svg',
              'title': 'banner'.tr,
            },
            {
              'iconPath': 'assets/icons/settings_icon.svg',
              'title': 'settings'.tr,
            },
          ],
          // icons: [
          //   FaIcon(FontAwesomeIcons.wifi),
          //   FaIcon(FontAwesomeIcons.history),
          //   FaIcon(FontAwesomeIcons.qrcode),
          //   FaIcon(FontAwesomeIcons.cog),
          // ]
      ),
    );
  }
}

class MyNavBar extends StatelessWidget{
  final List<Map> items;
  MyNavBar({Key? key, required this.items}) : super(key: key);

  final DashboardController dashboardController = Get.find(tag: 'dashboard');

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 66.h,
        decoration: BoxDecoration(
          color: bottomNavColor,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.16),
              spreadRadius: 4,
              // blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.only(
          left: 25.sp,
          right: 25.sp,
          bottom: 16.sp,
        ),
        child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) =>
                InkWell(
                  onTap: (){
                    dashboardController.changeTabIndex(index);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dashboardController.tabIndex.value == index
                      ? ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => activeGradient.createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: SvgPicture.asset(
                            items[index]['iconPath'],
                            color: dashboardController.tabIndex.value == index
                                ? mainColor
                                : mainColor1,
                            width: 16.sp,
                            height: 20.sp,
                          ),
                      )
                      : SvgPicture.asset(
                          items[index]['iconPath'],
                            color: dashboardController.tabIndex.value == index
                                ? mainColor
                                : mainColor1,
                            width: 16.sp,
                            height: 22.sp,
                        ),
                      SizedBox(
                        height: 2.h,
                      ),
                      dashboardController.tabIndex.value != index
                        ? Text(
                            items[index]['title'],
                            style: font10
                          )
                        : ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => activeGradient.createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                            child: Text(
                              items[index]['title'],
                              style: font10
                            )
                          )
                    ],
                  ),
                ),
            ),
          )
        )
    );
  }

}
