import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/pages/onboarding_page.dart';
import 'package:led_banner/theme/text_theme.dart';

class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  RxBool show = true.obs;

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  void setTimer(){
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingPage(),
        ),
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: RadialGradient(
              // center: Alignment(0.7, -0.6), // near the top right
              radius: 0.7,
              colors: [
                Color(0xff4A2868), Color(0xff412460).withOpacity(1),
                Color(0xff291B49).withOpacity(1), Color(0xff0A0F2D).withOpacity(1),
              ],
            ),
            image: DecorationImage(
              image: AssetImage('assets/onboarding_background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/icon.svg',
                  alignment: Alignment.center,
                  height: 260.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.sp),
                child: Text(
                  'LED Banner & Board & Billboard',
                  textAlign: TextAlign.center,
                  style: font28.copyWith(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w800
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}