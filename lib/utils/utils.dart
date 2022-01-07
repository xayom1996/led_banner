import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

final fonts = ['Outfit', 'PlayfairDisplay', 'Cinzel', 'RacingSansOne',
  'PressStart2P', 'ArchivoBlack', 'Aclonica', 'NotoSansKR', 'NotoSerifKR',
  'ZCOOLQingKeHuangYou', 'ZCOOLXiaoWei'];

final fontsSymbols = ['Aa', 'Aa', 'Aa', 'Aa', 'Aa', 'Aa', 'Aa',
  '야', '야', '嘿', '嘿'];

final fontSizes = [24, 36, 48, 64, 72, 96, 144, 288];

final fontColors = [Color(0xffFFFFFF), Color(0xff1B1D29), Color(0xff0BE7FB),
  Color(0xffFECC50), Color(0xffFA448C), Color(0xffF5C1F0), Color(0xffE953DA),
  Color(0xff4C44CF), Color(0xff70FF00)];

final gradients = [
  LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff63E2FF),
        Color(0xffB066FE),
      ]
  ),
  LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xffFFE0D7),
        Color(0xffFE9196),
      ]
  ),
];

final effects = [
  <Shadow>[
    Shadow(
      offset: Offset(0, 0),
      blurRadius: 20.sp,
      color: Colors.white,
    ),
  ],
  [],
];

final textDirections = [Axis.vertical, Axis.horizontal];

final speeds = ['still'.tr, '0.5x', '1x', '1.5x', '2x'];

final backgroundColors = [Color(0xff1B1D29), Color(0xff331A38), Color(0xff142F48),
  Color(0xff010B8B), Color(0xff491D88), Color(0xff1E8CB0), Color(0xff0BE7FB),
  Color(0xffFECC50), Color(0xffF5C1F0), Color(0xffE953DA), Color(0xff4C44CF),
  Color(0xffFA448C)];

final dynamicBackgrounds = [];
final abstractBackgrounds = [];

final List<Locale> locales = [
  Locale('en', 'US'),
  Locale('ja', 'JP'),
  Locale('ko', 'KR'),
  Locale('zh', 'CN'),
];