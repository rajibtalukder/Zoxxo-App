import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_texts.dart';
import 'side_drawer.dart';

class AdvertisingPage extends StatelessWidget {
  AdvertisingPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      key: scaffoldKey,
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, color: black, size: 20)),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(Icons.menu, color: black)),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              height: 144.h,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: btnGrey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: LottieBuilder.asset(
                "assets/lottie/brand-page.json",
                //fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(
                      "Present your brand to a huge community of gamers and more!",
                      color: black,
                      size: 26,
                      fontWeight: FontWeight.w500,
                      textCenter: false),
                  SizedBox(height: 15.h),
                  subTitleText(
                      "zoxxo offers companies on Upload- and Downloadpage an "
                      "opportunity to present their brand to a huge community of gamers – "
                      "which are main target group of zoxxo – and many more. Register and "
                      "place now your ads!",
                      textCenter: false,
                      color: black,size: 14, fontWeight: FontWeight.w400),
                  SizedBox(height: 15.h),
                  customButton('Register and run a campaign',
                      textSize: 14, textColor: white, radius: 10, height: 52)
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
