import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:led_banner/theme/color_theme.dart';
import 'package:led_banner/theme/text_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Settings', style: font28),
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.sp, right: 16.sp, top: 30.sp),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                // Get.to(ChangePasswordPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: const Color(0xff2D2A38),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 18.sp),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/term_of_us_icon.png',
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Text('terms_of_use'.tr, style: body1.copyWith(color: Colors.white)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff1B1D29),
                        size: 16.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: (){
                // Get.to(ChangePasswordPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: const Color(0xff2D2A38),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 18.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/privacy_policy_icon.png',
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Text('Privacy Policy', style: body1.copyWith(color: Colors.white)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff1B1D29),
                        size: 16.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: (){
                // Get.to(ChangePasswordPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: const Color(0xff2D2A38),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 18.sp),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/support_icon.png',
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Text('support'.tr, style: body1.copyWith(color: Colors.white)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff1B1D29),
                        size: 16.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: (){
                // Get.to(ChangePasswordPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: const Color(0xff2D2A38),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 18.sp),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/share_the_app_icon.png',
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Text('share_the_app'.tr, style: body1.copyWith(color: Colors.white)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff1B1D29),
                        size: 16.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: (){
                // Get.to(ChangePasswordPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: const Color(0xff2D2A38),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 18.sp),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/rate_the_app_icon.png',
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Text('rate_the_app'.tr, style: body1.copyWith(color: Colors.white)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff1B1D29),
                        size: 16.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

}