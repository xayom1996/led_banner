import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ListViewBannerText extends StatelessWidget {
  final String speed;
  final Axis textDirections;
  final Widget child;

  const ListViewBannerText({Key? key, required this.child, required this.textDirections,
    required this.speed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return speed == 'still'.tr
        ? ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
              scrollDirection: textDirections,
              child: child,
          ),
        )
        : child;
  }
  
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}