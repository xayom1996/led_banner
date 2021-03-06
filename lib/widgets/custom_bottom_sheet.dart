import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:led_banner/models/banner.dart';
import 'package:led_banner/theme/color_theme.dart';
import 'package:led_banner/theme/text_theme.dart';
import 'package:led_banner/utils/utils.dart';
import 'package:led_banner/widgets/rectangle.dart';

class CustomBottomSheet extends StatelessWidget {
  final Rx<BannerParameters> parameters;
  final Function(BannerParameters) onChange;
  final RxBool isLoading;

  CustomBottomSheet({Key? key, required this.parameters, required this.onChange, required this.isLoading}) : super(key: key);
  RxString tab = 'text'.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      height: 0.5.sh,
      child: SingleChildScrollView(
        child: Obx(() => Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.sp, bottom: 16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  GestureDetector(
                    onTap: () {
                      tab('text');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'text'.tr,
                          style: headline.copyWith(
                            color: tab.value == 'text'
                                ? Colors.white
                                : Color(0xff454B5B),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 88.w,
                          height: tab.value == 'text' ? 1.h : 0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tab('background');
                    },
                    child: Column(
                      children: [
                        Text(
                          'background'.tr,
                          style: headline.copyWith(
                              color: tab.value == 'background'
                                  ? Colors.white
                                  : Color(0xff454B5B),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 88.w,
                          height: tab.value == 'background' ? 1.h : 0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onChange(parameters.value);
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/check_text_icon.svg',
                      height: 18.h,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xff454B5B),
            ),
            Padding(
              padding: EdgeInsets.all(24.sp),
              child: tab.value == 'text'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'font'.tr,
                          style: body3.copyWith(
                            color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              fonts.length,
                                  (i) => Padding(
                                    padding: EdgeInsets.only(right: 16.sp),
                                    child: Rectangle(
                                      onTap: () {
                                        parameters.value.font = fonts[i];
                                        parameters.refresh();
                                      },
                                      isActive: parameters.value.font == fonts[i],
                                      child: Text(
                                        fontsSymbols[i],
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: fonts[i],
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                        ),
                        Text(
                          'font_size'.tr,
                          style: body3.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              fontSizes.length,
                                  (i) => Padding(
                                padding: EdgeInsets.only(right: 16.sp),
                                child: Rectangle(
                                  isActive: parameters.value.fontSize == fontSizes[i],
                                  onTap: () {
                                    parameters.value.fontSize = fontSizes[i];
                                    parameters.refresh();
                                  },
                                  child: Text(
                                    fontSizes[i].toString(),
                                    style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontSize: 17.sp,
                                        color: Colors.white
                                    ),
                                  ),
                                )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                        ),
                        Text(
                          'font_color'.tr,
                          style: body3.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              fontColors.length,
                                  (i) => Padding(
                                  padding: EdgeInsets.only(right: 16.sp),
                                  child: Rectangle(
                                    isActive: parameters.value.fontColor == fontColors[i],
                                    onTap: () {
                                      parameters.value.fontColor = fontColors[i];
                                      parameters.value.gradient = null;
                                      parameters.refresh();
                                    },
                                    color: fontColors[i],
                                  )
                              ),
                            ) +
                                List.generate(
                                  gradients.length,
                                      (i) => Padding(
                                      padding: EdgeInsets.only(right: 16.sp),
                                      child: Rectangle(
                                          onTap: () {
                                            parameters.value.gradient = gradients[i];
                                            parameters.value.fontColor = null;
                                            parameters.refresh();
                                          },
                                          isActive: parameters.value.gradient == gradients[i],
                                          gradient: gradients[i]
                                      )
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                        ),
                        Text(
                          'effect'.tr,
                          style: body3.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 16.sp),
                                child: Rectangle(
                                  isActive: parameters.value.shadows!.isNotEmpty,
                                  onTap: () {
                                    parameters.value.shadows = <Shadow>[
                                      Shadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 20.sp,
                                        color: Colors.white,
                                      ),
                                    ];
                                    parameters.refresh();
                                  },
                                  child: Text(
                                    'Aa',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 20.sp,
                                            color: Colors.white,
                                          ),
                                        ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 16.sp),
                                child: Rectangle(
                                  isActive: parameters.value.shadows!.isEmpty,
                                  onTap: () {
                                    parameters.value.shadows = [];
                                    parameters.refresh();
                                  },
                                  child: Text(
                                    'Aa',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                        ),
                        Text(
                          'text_direction'.tr,
                          style: body3.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              textDirections.length,
                                  (i) => Padding(
                                  padding: EdgeInsets.only(right: 16.sp),
                                  child: Rectangle(
                                    isActive: parameters.value.textDirections == textDirections[i],
                                    onTap: () {
                                      parameters.value.textDirections = textDirections[i];
                                      parameters.refresh();
                                    },
                                    child: textDirections[i] == Axis.horizontal
                                        ? Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Aa',
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              RotatedBox(
                                                quarterTurns: 1,
                                                child: Icon(
                                                  Icons.arrow_right_alt,
                                                  size: 14.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        : RotatedBox(
                                          quarterTurns: 1,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Aa',
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_right_alt,
                                                  size: 14.sp,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                        ),
                                  )
                              ),
                            )
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                        ),
                        Text(
                          'speed'.tr,
                          style: body3.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                speeds.length,
                                    (i) => Padding(
                                    padding: EdgeInsets.only(right: 16.sp),
                                    child: Rectangle(
                                      isActive: parameters.value.speed == speeds[i],
                                      onTap: () {
                                        if (speeds[i] != parameters.value.speed) {
                                          isLoading(true);
                                          parameters.value.speed = speeds[i];
                                          parameters.refresh();
                                          Timer(
                                              Duration(milliseconds: 500), () {
                                            isLoading(false);
                                          });
                                        }
                                      },
                                      child: Text(
                                        speeds[i],
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                ),
                              )
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'background_color'.tr,
                          style: body3.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              backgroundColors.length,
                                  (i) => Padding(
                                  padding: EdgeInsets.only(right: 16.sp),
                                  child: Rectangle(
                                    isActive: parameters.value.backgroundColor == backgroundColors[i],
                                    onTap: () {
                                      parameters.value.backgroundColor = backgroundColors[i];
                                      parameters.value.abstractBackground = null;
                                      parameters.value.dynamicBackground = null;
                                      parameters.refresh();
                                    },
                                    color: backgroundColors[i],
                                  )
                              ),
                            )
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                        ),
                        Text(
                          'dynamic_background'.tr,
                          style: body3.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(22,
                                    (i) => Padding(
                                    padding: EdgeInsets.only(right: 16.sp),
                                    child: Rectangle(
                                      isActive: parameters.value.dynamicBackground == 'assets/dynamic_backgrounds/${i + 1}.mp4',
                                      onTap: () {
                                        isLoading(true);
                                        parameters.value.dynamicBackground = 'assets/dynamic_backgrounds/${i + 1}.mp4';
                                        parameters.value.abstractBackground = null;
                                        parameters.value.backgroundColor = null;
                                        parameters.refresh();
                                        Timer(Duration(milliseconds: 500), () {
                                          isLoading(false);
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/dynamic_backgrounds/rectangle/Rectangle ${i + 1}.png',
                                      ),
                                    )
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                        ),
                        Text(
                          'abstract_background'.tr,
                          style: body3.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(15,
                                    (i) => Padding(
                                    padding: EdgeInsets.only(right: 16.sp),
                                    child: Rectangle(
                                      isActive: parameters.value.abstractBackground == 'assets/abstract_backgrounds/${i + 1}.png',
                                      onTap: () {
                                        parameters.value.abstractBackground = 'assets/abstract_backgrounds/${i + 1}.png';
                                        parameters.value.dynamicBackground = null;
                                        parameters.value.backgroundColor = null;
                                        parameters.refresh();
                                      },
                                      child: Image.asset(
                                        'assets/abstract_backgrounds/rectangle/Rectangle ${i + 1}.png',
                                      ),
                                    )
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          height: 21.sp,
                        ),
                      ],
                    ),
            ),
          ],
        )),
      ),
    );
  }

}