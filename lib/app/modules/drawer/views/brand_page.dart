import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zoxxo/app/modules/drawer/views/side_drawer.dart';

import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_texts.dart';

class BrandPage extends StatelessWidget {
  BrandPage({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Container(
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
            titleText("Our mission & vision!",
                color: black,
                size: 26,
                fontWeight: FontWeight.w500,
                textCenter: false),
            SizedBox(height: 15.h),
            subTitleText(
                "Our Mission is to deliver the data around the internet "
                "by considering security, speed and anonymity.",
                textCenter: false,
                color: black,
                size: 14,
                fontWeight: FontWeight.w400),
            SizedBox(height: 30.h),
            titleText("Our values", color: black, size: 18),
            SizedBox(height: 15.h),
            SizedBox(
                height: 170.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      rowItem('01', 'Provide state of the art technology',
                          'zoxxo is a modern platform to upload your data anonymus, secure and fast.'),
                      rowItem('02', 'Anonymity and security are fundamentals',
                          'Share your uploaded data and ideas with your friends, family and others!'),
                      rowItem('03', 'Build things that inspire our community',
                          'zoxxo Manage provides an easy way to manage your uploads in Workspaces.'),
                      SizedBox(width: 6.w),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Container rowItem(String num, String text, String subText) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
      height: 154.h,
      width: 250.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: greyLight.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        color: whiteDefault,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 28.h,
            width: 28.w,
            decoration: BoxDecoration(
              color: red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Center(
                child: subTitleText(num,
                    color: red, size: 16, fontWeight: FontWeight.w700)),
          ),
          const Spacer(),
          subTitleText(text,
              textCenter: false,
              color: black,
              size: 16,
              fontWeight: FontWeight.w500),
          subTitleText(subText,
              color: black,
              textCenter: false,
              size: 10,
              fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}
