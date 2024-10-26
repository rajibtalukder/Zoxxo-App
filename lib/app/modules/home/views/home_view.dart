import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';
import 'package:zoxxo/app/modules/bottom_actions/controller/custom_bottomsheet_controller.dart';
import 'package:zoxxo/app/modules/home/views/widgets/pageview_widget.dart';

import '../../../constants/colors.dart';
import '../../../constants/font_constant.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../bottom_actions/views/custom_bottom_sheet.dart';
import '../../bottom_actions/views/widgets/progress_indicator_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  CustomBottomsheetController customBottomsheetController =
      Get.put(CustomBottomsheetController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 4.h),
                DottedBorder(
                  borderType: BorderType.RRect,
                  // Rounded Rectangle
                  radius: Radius.circular(20.r),
                  // Match borderRadius of the container
                  dashPattern: const [8, 4],
                  // Customize dash and gap lengths
                  color: red,
                  // Set your border color (same as the text and image color)
                  strokeWidth: 1,
                  child: GestureDetector(
                    onTap: () async {
                      await customBottomsheetController.pickFiles().then((e) {
                        Get.bottomSheet(
                          CustomBottomSheet(), // Call the custom BottomSheet
                          backgroundColor: white,
                          isScrollControlled: true,
                        );
                      });
                    },
                    child: Container(
                      height: 141.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: red.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 35.h,
                            width: 35.w,
                            child: Image.asset('assets/images/upload.png',
                                color: red),
                          ),
                          subTitleText('Click here to upload a file',
                              color: red, fontWeight: FontWeight.w400, size: 20)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                Align(
                  alignment: Alignment.center,
                  child: titleText(
                      'Centralize file storage – Everything in one location.',
                      color: black,
                      size: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20.h),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // Disable GridView scrolling
                  children: [
                    buildBoxItem("assets/images/anonimus.svg", 'Anonymous',
                        'From A to Z. Nobody knows you'),
                    buildBoxItem("assets/images/secure.svg", 'Secure',
                        'Every nano byte is. encrypted'),
                    buildBoxItem("assets/images/fast.svg", 'Fast',
                        'You will not feel the speed'),
                    buildBoxItem("assets/images/unlimited.svg", 'Unlimited',
                        'More data? More power!'),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          SizedBox(height: 510.h, child: PageviewWidget())
        ],
      ),
    );
  }

  Widget buildBoxItem(String imgUrl, String title, String subTitle) {
    return Container(
      //margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 140.h,
      width: 160.w,
      decoration: BoxDecoration(
        color: isDarkMode ? greyBG : white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: greyLight.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          SizedBox(
            height: 45.h,
            width: 40.w,
            child: SvgPicture.asset(imgUrl),
          ),
          SizedBox(height: 8.h),
          titleText(title, color: black, size: 16, fontWeight: FontWeight.w400),
          subTitleText(subTitle,
              size: 12, fontWeight: FontWeight.w400, color: grey),
        ],
      ),
    );
  }
}
