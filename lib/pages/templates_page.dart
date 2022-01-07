import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:led_banner/models/banner.dart';
import 'package:led_banner/pages/banner_page.dart';
import 'package:led_banner/theme/color_theme.dart';
import 'package:led_banner/theme/text_theme.dart';
import 'package:led_banner/utils/utils.dart';
import 'package:led_banner/widgets/video_background_container.dart';
import 'package:led_banner/widgets/banner_text.dart';
import 'package:led_banner/widgets/custom_bottom_sheet.dart';
import 'package:marquee/marquee.dart';

class TemplatesPage extends StatelessWidget {
  TemplatesPage({Key? key}) : super(key: key);

  var templates = [
    BannerParameters(
      abstractBackground: 'assets/abstract_backgrounds/14.png',
      fontSize: 144,
      fontColor: fontColors[3],
    ),
    BannerParameters(
      backgroundColor: backgroundColors[1],
      fontSize: 144,
      shadows: <Shadow>[
        Shadow(
          offset: Offset(0, 0),
          blurRadius: 20.sp,
          color: Colors.white,
        ),
      ],
      fontColor: fontColors[0]
    ),
    BannerParameters(
        backgroundColor: Color(0xffFECC50),
        font: 'ArchivoBlack',
        fontSize: 144,
        fontColor: Color(0xff4C44CF)
    ),
    BannerParameters(
        abstractBackground: 'assets/abstract_backgrounds/13.png',
        font: 'Cinzel',
        fontSize: 144,
        fontColor: Color(0xff1B1D29)
    ),
    BannerParameters(
        backgroundColor: Color(0xff142F48),
        font: 'PressStart2P',
        fontSize: 144,
        fontColor: Color(0xff70FF00)
    ),
    BannerParameters(
        abstractBackground: 'assets/abstract_backgrounds/15.png',
        font: 'Aclonica',
        fontSize: 144,
        fontColor: Color(0xffFA448C)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Templates', style: font28),
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(6,
                (i) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 24.sp),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(
                        BannerPage(
                          parameters: templates[i].obs,
                          isTemplate: true,
                          bannerText: 'hello'.tr.obs,
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/templates/template_${i + 1}.png',
                      height: 80.h,
                    ),
                  ),
                ),
          )
      ),
      // body: Column(
      //   children: [
      //     Image.asset(
      //       'assets/templates/template_1.png'
      //     ),
      //   ],
      // )
    );
  }

}