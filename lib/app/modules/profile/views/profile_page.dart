import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/custom_widgets/custom_button.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';

import '../../auth/controllers/signin_controller.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

  final SigninController signCon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back, color: black, size: 20)),
                  subTitleText('Profile',
                      color: black, size: 16, fontWeight: FontWeight.w500),
                  const SizedBox()
                ],
              ),
              SizedBox(height: 27.h),
              Container(
                height: 147.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: greyBG,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  color: whiteDefault,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(14.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 51.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(50.r)),
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText("Md. Tanzirul Karim",
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                  size: 20),
                              subTitleText('tanzirulkarin.zoxxo528@gmail.com',
                                  color: black, size: 12)
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: greyLight.withOpacity(0.4),
                      height: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.r),
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: btnGrey,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: SvgPicture.asset("assets/images/free.svg"),
                          ),
                          SizedBox(width: 10.w),
                          subTitleText("Forever free",
                              color: black,
                              size: 16,
                              fontWeight: FontWeight.w500),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: black,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tapBox('Manage'),
                  tapBox('Ads'),
                ],
              ),
              SizedBox(height: 20.h),
              itemRow("assets/images/file.svg", "Account"),
              SizedBox(height: 25.h),
              itemRow("assets/images/wallet.svg", "Plan & Billing"),
              SizedBox(height: 25.h),
              itemRow("assets/images/preference.svg", "Preferences"),
              SizedBox(height: 25.h),
              itemRow("assets/images/communicaton.svg", "Communications"),
              SizedBox(height: 25.h),
              itemRow("assets/images/monitize.svg", "Monetization"),
              SizedBox(height: 25.h),
              itemRow("assets/images/setting.svg", "Settings"),
              SizedBox(height: 25.h),
              customButton('Logout',
                  onPressed: (){
                    signCon.signOut();
                  },
                  textColor: Colors.white,
                  width: 100.w,
                  height: 36.h,
                  radius: 5.r)
            ],
          ),
        ),
      ),
    );
  }

  Row itemRow(String imgUrl, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 24.h,
          width: 24.h,
          child: SvgPicture.asset(imgUrl),
        ),
        SizedBox(width: 12.w),
        subTitleText(text, color: black, size: 16, fontWeight: FontWeight.w400),
        const Spacer(),
        Icon(Icons.arrow_forward_ios, color: black, size: 18),
        SizedBox(width: 6.w),
      ],
    );
  }

  Container tapBox(String text) {
    return Container(
      height: 70.h,
      width: 160.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: greyBG,
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
        color: whiteDefault,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5.r),
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
                color: btnGrey, borderRadius: BorderRadius.circular(50.r)),
            child: SvgPicture.asset("assets/images/file.svg"),
          ),
          SizedBox(width: 12.w),
          subTitleText(text,
              color: black, fontWeight: FontWeight.w400, size: 16)
        ],
      ),
    );
  }
}
