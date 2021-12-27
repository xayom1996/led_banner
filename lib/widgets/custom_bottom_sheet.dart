import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:led_banner/theme/color_theme.dart';
import 'package:led_banner/theme/text_theme.dart';
import 'package:led_banner/utils/utils.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      height: 0.5.sh,
      padding: EdgeInsets.all(24.sp),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Font',
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
                        child: Container(
                          height: 48.h,
                          width: 48.h,
                          child: Center(
                            child: Text(
                              'Aa',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: fonts[i],
                                color: Colors.white
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xff2D2A38),
                              borderRadius: BorderRadius.all(Radius.circular(8.sp))
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
              'Font Size',
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
                    child: Container(
                      height: 48.h,
                      width: 48.h,
                      child: Center(
                        child: Text(
                          fontSizes[i].toString(),
                          style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 17.sp,
                              color: Colors.white
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff2D2A38),
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
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
              'Font Color',
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
                      child: Stack(
                        children: [
                          Container(
                            height: 48.h,
                            width: 48.h,
                            decoration: BoxDecoration(
                              color: fontColors[i],
                              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                            ),
                          ),
                        ],
                      )
                  ),
                ) +
                    List.generate(
                      gradients.length,
                          (i) => Padding(
                          padding: EdgeInsets.only(right: 16.sp),
                          child: Container(
                            height: 48.h,
                            width: 48.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                              gradient: gradients[i]
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
              'Effect',
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
                    child: Container(
                      height: 48.h,
                      width: 48.h,
                      decoration: BoxDecoration(
                        color: Color(0xff2D2A38),
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                      ),
                      child: Center(
                        child: Text(
                          'Aa',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              shadows: const <Shadow>[
                                Shadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 4.0,
                                  color: Colors.white,
                                ),
                              ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.sp),
                    child: Container(
                      height: 48.h,
                      width: 48.h,
                      decoration: BoxDecoration(
                        color: Color(0xff2D2A38),
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                      ),
                      child: Center(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}