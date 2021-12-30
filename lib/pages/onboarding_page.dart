import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:led_banner/lang/translates.dart';
import 'package:led_banner/pages/dashboard_page.dart';
import 'package:led_banner/theme/text_theme.dart';

class OnBoardingPage extends StatelessWidget {
  final _controller = PageController();

  RxInt _currentIndex = 0.obs;

  final explanationPages = [
    ExplanationPage(
      title: 'onboarding_1_title'.tr,
      description: 'onboarding_1_descr'.tr,
      localImages: ['assets/illustration_1.png'],
      isLastPage: false,
    ),
    ExplanationPage(
      title: 'onboarding_2_title'.tr,
      description: 'onboarding_2_descr'.tr,
      localImages: ['assets/illustration_2.png'],
      isLastPage: false,
    ),
    ExplanationPage(
      title: 'onboarding_4_title'.tr,
      description: 'onboarding_4_descr'.tr,
      localImages: ['assets/illustration_3.png'],
      isLastPage: false,
    ),
    ExplanationPage(
      title: 'sub_title'.tr,
      description: 'sub_descr'.tr,
      localImages: ['assets/illustration_4.png'],
      isLastPage: true,
    ),
  ];

  final InAppReview inAppReview = InAppReview.instance;

  void rateApp() async{
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  Widget build(BuildContext context){
    return Material(
      type: MaterialType.transparency,
      child: Container(
          decoration: BoxDecoration(
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
          child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: PageView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      controller: _controller,
                                      onPageChanged: (value) {
                                        _currentIndex(value);
                                        if (value == 1) {
                                          Future.delayed(const Duration(milliseconds: 500), () {
                                            rateApp();
                                          });
                                        }
                                      },
                                      children: explanationPages,
                                    )
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Spacer(),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(horizontal: 56.sp),
                                      child: GestureDetector(
                                        onTap: (){
                                          if (_currentIndex.value == 3){
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DashboardPage(),
                                              ),
                                                  (route) => false,
                                            );
                                          }
                                          _controller.nextPage(
                                              duration: Duration(milliseconds: 200),
                                              curve: Curves.easeInOut
                                          );
                                        },
                                        child: Image.asset(
                                          'assets/continue_button.png',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            'term_of_use'.tr,
                                            textAlign: TextAlign.center,
                                            style: caption.copyWith(
                                                color: Color(0xff454B5B)
                                            )
                                        ),
                                        Text(
                                            'restore_purchase'.tr,
                                            textAlign: TextAlign.center,
                                            style: caption.copyWith(
                                                color: Color(0xff454B5B)
                                            )
                                        ),
                                        Text(
                                            'privacy_policy'.tr,
                                            textAlign: TextAlign.center,
                                            style: caption.copyWith(
                                              color: Color(0xff454B5B)
                                            )
                                        )
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 25.h,
                                    // ),
                                    // Spacer(),
                                    // SizedBox(
                                    //   height: 16.sp,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
              ))
      ),
    );
  }

  createCircle({required int index}) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        margin: EdgeInsets.only(right: 8.w),
        height: 8.w,
        width: 8.w, // current indicator is wider
        decoration: BoxDecoration(
          color: _currentIndex.value != index ? Color(0xffBDBDBD): Color(0xff6921C6),
          borderRadius: BorderRadius.circular(8.w),
        )
    );
  }
}

class ExplanationPage extends StatelessWidget{
  final String title;
  final String description;
  final List<String> localImages;
  final bool isLastPage;

  const ExplanationPage({Key? key, required this.title, required this.description, required this.localImages, required this.isLastPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLastPage)
          Positioned(
            top: 8.sp,
            left: 8.sp,
            child: IconButton(
              onPressed: (){
                // PasswordController passwordController = Get.find(tag: 'password');

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(),
                  ),
                      (route) => false,
                );
              },
              icon: Icon(
                Icons.close,
                size: 24.sp,
                color: Colors.white,
                // #5B5B5B
              ),
            ),
          ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            for (var img in localImages)
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      img,
                      alignment: Alignment.center,
                      // height: localImages.length == 1 ? 252.h : 128.h,
                      width: 1.sw,
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            SizedBox(height: 30.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: font24
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: body1.copyWith(
                      color: Color(0xffF5F5F7).withOpacity(0.3)
                    )
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

