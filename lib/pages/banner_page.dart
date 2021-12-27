import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:led_banner/theme/color_theme.dart';
import 'package:led_banner/theme/text_theme.dart';
import 'package:led_banner/widgets/custom_bottom_sheet.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'To create a new banner, enter text in the field and select the options you want',
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
            Spacer(),
            Row(
              children: [
                Flexible(
                  child: Container(
                    height: 48.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
                    decoration: BoxDecoration(
                        color: Color(0xff2D2A38),
                        borderRadius: BorderRadius.all(Radius.circular(8.sp))
                    ),
                    child: TextField(
                      style: body1.copyWith(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                        hintText: 'Banner text here',
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
                    Get.bottomSheet(
                      CustomBottomSheet(),
                      backgroundColor: Colors.transparent,
                    );
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
                Container(
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
              ],
            ),
          ],
        ),
      ),
    );
  }

}