import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/constants/font_constant.dart';
import 'package:zoxxo/app/modules/splash/views/page_view.dart';

import '../../bottom_actions/views/bottom_navigation_bar_page.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {

    applyThem(isDarkMode);
    super.initState();
  }
  //get splash => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: SizedBox(
          height: 160.h,
          width: 160.h,
          child: LottieBuilder.asset("assets/lottie/zoxxo.json",
              fit: BoxFit.cover),
        ),
      ),
      nextScreen:isSplashAdCheck?BottomNavigationBarPage(): const LandingPageView(),
      splashIconSize: 400,
      backgroundColor: white,
      duration: 1000,
    );

    /*return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
            //backgroundColor: red,
            body: Center(
                child: SizedBox(
                    height: 148.h,
                    width: 170.w,
                    child: Image.asset(
                      "assets/images/splash_logo.png",
                      fit: BoxFit.cover,
                      color: red,
                    ))),
          );
        });*/
  }
}
