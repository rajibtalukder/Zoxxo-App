import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/modules/pricing/controllers/pricing_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/font_constant.dart';
import '../../../../custom_widgets/custom_texts.dart';

Container showPricingWidget(PricingController con) {
  return Container(
    height: 400.h,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: btnGrey)),
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subTitleText('Forever free',
              color: black, fontWeight: FontWeight.w400, size: 14),
          SizedBox(height: 5.h),
          Row(
            children: [
              subTitleText(
                  con.selectedIndex.value == 0
                      ? '\$0/'
                      : con.selectedIndex.value == 1
                          ?con.isYear.value?'\$118.99': '\$10.99'
                          : con.isYear.value?'\$218.99':'\$40.99',
                  color: black,
                  size: 14,
                  fontWeight: FontWeight.w600),
              subTitleText('month',
                  color: black, size: 12, fontWeight: FontWeight.w400),
            ],
          ),
          SizedBox(height: 5.h),
          subTitleText('Upload files and share links as much as you like',
              color: black, fontWeight: FontWeight.w400, size: 10),
          SizedBox(height: 34.h),
          subTitleText('No money no problem',
              color: red, size: 14, fontWeight: FontWeight.w600),
          SizedBox(height: 24.h),
          Row(
            children: [
              Container(
                height: 16.h,
                width: 16.h,
                decoration: BoxDecoration(
                    color: btnGrey, borderRadius: BorderRadius.circular(50.r)),
                child: Icon(Icons.done, size: 10, color: black),
              ),
              SizedBox(width: 12.w),
              subTitleText(
                  con.selectedIndex.value == 0
                      ? 'Transfer 2 GB'
                      : 'Unlimited file',
                  color: black,
                  fontWeight: FontWeight.w400,
                  size: 14),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                height: 16.h,
                width: 16.h,
                decoration: BoxDecoration(
                    color: btnGrey, borderRadius: BorderRadius.circular(50.r)),
                child: Icon(Icons.done, size: 10, color: black),
              ),
              SizedBox(width: 12.w),
              subTitleText(
                  con.selectedIndex.value == 0
                      ? '4 GB storage'
                      : '1 TB storage',
                  color: black,
                  fontWeight: FontWeight.w400,
                  size: 14),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode ? buttonDark : red,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Create account',
                        size: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                )),
          )
        ],
      ),
    ),
  );
}
