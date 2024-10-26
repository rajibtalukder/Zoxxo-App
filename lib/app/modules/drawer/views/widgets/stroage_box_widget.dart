import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/font_constant.dart';
import '../../../../custom_widgets/custom_texts.dart';

Container stroageBoxWidget() {
  return Container(
    padding: EdgeInsets.all(12.w),
    height: 99.h,
    width: 262.w,
    decoration: BoxDecoration(
        color: greyBG,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: btnGrey)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 22.h,
              width: 22.h,
              child: Image.asset("assets/images/cloud.png"),
            ),
            SizedBox(width: 8.w),
            subTitleText('Storage',
                color: black,
                size: 14,
                fontWeight: FontWeight.w600),
            const Expanded(child: SizedBox()),

            /*
                    /// ***************** Only premium user can see this upgrade item **********

                    Container(
                      height: 32.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: Image.asset(
                              "assets/images/upgrade.png",
                              color: black,
                            ),
                          ),
                          SizedBox(width: 7.w),
                          subTitleText('Upgrade',
                              color: black,
                              size: 14,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    )

                    /// ***************** Only premium user can see this upgrade item **********
                    */
          ],
        ),
        SizedBox(height: 8.h),
        Stack(children: [
          Container(
            height: 3.h,
            decoration: BoxDecoration(
                color: isDarkMode ? Colors.white : btnGrey,
                borderRadius: BorderRadius.circular(10.r)),
          ),
          SizedBox(
            height: 3.h,
            width: 130.w,
            // decoration: BoxDecoration(
            //     color: red,
            //     borderRadius: BorderRadius.circular(10.r)),
          ),
        ]),
        SizedBox(height: 8.h),
        subTitleText('0 GB of 2 GB used',
            color: grey, fontWeight: FontWeight.w400, size: 12)
      ],
    ),
  );
}