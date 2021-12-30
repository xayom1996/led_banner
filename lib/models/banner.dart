import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerParameters {
  String font;
  int fontSize;
  Color? fontColor;
  Gradient? gradient;
  List<Shadow>? shadows;
  Axis textDirections;
  String? speed;
  Color? backgroundColor;
  String? dynamicBackground;
  String? abstractBackground;

  BannerParameters({
    this.font = 'Outfit',
    this.fontSize = 24,
    this.fontColor = const Color(0xffFFFFFF),
    this.gradient,
    this.shadows = const [],
    this.textDirections = Axis.vertical,
    this.speed = 'Still',
    this.backgroundColor,
    this.dynamicBackground,
    this.abstractBackground
  });
}