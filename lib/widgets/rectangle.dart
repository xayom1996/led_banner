import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rectangle extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Gradient? gradient;
  final bool isActive;
  final Function()? onTap;

  const Rectangle({Key? key, this.child, this.isActive = false,
    this.color = const Color(0xff2D2A38), this.gradient, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        width: 48.h,
        decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          border: isActive ? Border.all(color: Colors.blueAccent, width: 2.w) : null,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }

}