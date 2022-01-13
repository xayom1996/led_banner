import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:led_banner/models/banner.dart';
import 'package:led_banner/theme/color_theme.dart';
import 'package:led_banner/theme/text_theme.dart';
import 'package:led_banner/widgets/list_view_banner_text.dart';
import 'package:led_banner/widgets/video_background_container.dart';
import 'package:led_banner/widgets/banner_text.dart';
import 'package:led_banner/widgets/custom_bottom_sheet.dart';
import 'package:marquee/marquee.dart';

class BannerPage extends StatelessWidget {
  final Rx<BannerParameters> parameters;
  final bool isTemplate;
  final RxString bannerText;
  BannerPage({Key? key, required this.parameters, this.isTemplate = false, required this.bannerText}) : super(key: key);

  BannerParameters newParameters = BannerParameters(
    speed: 'still'.tr,
  );
  String newBannerText = '';

  FocusNode myFocusNode = FocusNode();
  RxBool isLoading = false.obs;
  TextEditingController bannerTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    newParameters = parameters.value;
    newBannerText = bannerText.value;
    bannerTextController.text = newBannerText;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: true,
        body: Obx(() => Stack(
          children: [
            if (parameters.value.dynamicBackground != null && isLoading.value == false)
              VideoBackgroundContainer(
                videoAsset: parameters.value.dynamicBackground!,
              ),
            if (parameters.value.backgroundColor != null && isLoading.value == false)
              Container(
                color: parameters.value.backgroundColor,
              ),
            if (parameters.value.abstractBackground != null && isLoading.value == false)
              Image.asset(
                parameters.value.abstractBackground!,
                fit: BoxFit.cover,
                width: 1.sw,
              ),
            Align(
              alignment: Alignment.center,
              child: bannerText.value != ''
                  ? Obx(() => isLoading.value == true
                  ? Center(
                    child: CircularProgressIndicator(),
                  )
                  : ListViewBannerText(
                      speed: parameters.value.speed!,
                      textDirections: parameters.value.textDirections,
                      child: parameters.value.gradient != null
                          ? ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => parameters.value.gradient!.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                        child: BannerText(
                            text: bannerText.value,
                            parameters: parameters.value
                        ),
                      )
                          : BannerText(
                          text: bannerText.value,
                          parameters: parameters.value
                      ),
                    ))
                  : Padding(
                      padding: EdgeInsets.all(24.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'home_intro_text'.tr,
                            textAlign: TextAlign.center,
                            style: headline.copyWith(
                                color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 36.h,
                          ),
                          SvgPicture.asset(
                            'assets/icons/arrow_down.svg',
                            color: Colors.white,
                            height: 16.h,
                          ),
                        ],
                      ),
                    ),
            ),

            if (isTemplate)
              Positioned(
                top: 24,
                left: 24,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 48.h,
                    width: 48.h,
                    decoration: BoxDecoration(
                        color: Color(0xff2D2A38),
                        borderRadius: BorderRadius.all(Radius.circular(8.sp))
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/arrow_left.svg',
                        height: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),

            Positioned(
              bottom: 24.sp,
              left: 24.sp,
              child: Row(
                children: [
                  SizedBox(
                    width: 0.6.sw,
                    child: Container(
                        height: 48.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
                        decoration: BoxDecoration(
                            color: Color(0xff2D2A38),
                            borderRadius: BorderRadius.all(Radius.circular(8.sp))
                        ),
                        child: TextField(
                          focusNode: myFocusNode,
                          controller: bannerTextController,
                          style: body1.copyWith(
                              color: Colors.white
                          ),
                          onChanged: (String value) {
                            newBannerText = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'bannex_text_placehoalder'.tr,
                            hintStyle: body1.copyWith(
                                color: Color(0xff454B5B)
                            ),
                            contentPadding: const EdgeInsets.all(0),
                            isDense: true,
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        )
                    ),
                  ),
                  SizedBox(width: 8.sp,),
                  GestureDetector(
                    onTap: () {
                      isLoading(true);
                      Timer(Duration(milliseconds: 500), () {
                        bannerText(newBannerText);
                        parameters(newParameters);
                        parameters.refresh();
                        isLoading(false);
                      });
                    },
                    child: Container(
                      height: 48.h,
                      width: 48.h,
                      decoration: BoxDecoration(
                          color: Color(0xff2D2A38),
                          borderRadius: BorderRadius.all(Radius.circular(8.sp))
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/check_text_icon.svg',
                          height: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.sp,),
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      Get.bottomSheet(
                        CustomBottomSheet(
                          parameters: parameters.value.copy().obs,
                          onChange: (BannerParameters newParams) {
                            newParameters = newParams;
                          },
                        ),
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                      );
                    },
                    child: Container(
                      height: 48.h,
                      width: 48.h,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/edit_text_icon.svg',
                          height: 18.sp,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff2D2A38),
                          borderRadius: BorderRadius.all(Radius.circular(8.sp))
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
        ),
      ),
    );
  }

}