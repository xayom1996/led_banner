import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:led_banner/models/banner.dart';
import 'package:led_banner/theme/color_theme.dart';
import 'package:led_banner/theme/text_theme.dart';
import 'package:marquee/marquee.dart';

class BannerText extends StatelessWidget {
  final BannerParameters parameters;
  final String text;

  BannerText({Key? key, required this.parameters, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: parameters.textDirections == Axis.vertical
          ? 1
          : 0,
      child: parameters.speed != null && parameters.speed != 'still'.tr
          ? Marquee(
              text: text,
              crossAxisAlignment: CrossAxisAlignment.center,
              // startPadding: 100.0,
              velocity: _getVelocity(parameters.speed!),
              blankSpace: parameters.textDirections == Axis.vertical
                  ? MediaQuery.of(context).size.height - 48.h
                  : MediaQuery.of(context).size.width,
              style: TextStyle(
                  fontFamily: parameters.font,
                  color: parameters.fontColor,
                  fontSize: parameters.fontSize.sp,
                  shadows: parameters.shadows,
              ),
            )
          : Text(
              text,
              maxLines: 1,
              style: TextStyle(
                fontFamily: parameters.font,
                color: parameters.fontColor,
                fontSize: parameters.fontSize.sp,
                shadows: parameters.shadows,
              ),
            )
    );
  }

  double _getVelocity(String speed) {
    switch (speed) {
      case '0.5x':
        return 50;
      case '1x':
        return 100;
      case '1.5x':
        return 150;
      case '2x':
        return 200;
      default:
        return 100;
    }
  }
}