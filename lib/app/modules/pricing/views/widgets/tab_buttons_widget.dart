import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/modules/pricing/controllers/pricing_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';

Widget tabButtonsWidget(PricingController con) {
  return Obx(()=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              con.selectedIndex.value=0;
            },
            child: Container(
                height: 40.h,
                width: 95.w,
                decoration: BoxDecoration(
                  border: Border.all(color:con.selectedIndex.value==0? red:btnGrey),
                  color: con.selectedIndex.value==0? red:white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: subTitleText('Forever free',
                      size: 12,
                      color:con.selectedIndex.value==0? white: black,
                      fontWeight: FontWeight.w600),
                )),
          ),
          GestureDetector(
            onTap: () {
              con.selectedIndex.value=1;
            },
            child: Container(
                height: 40.h,
                width: 95.w,
                decoration: BoxDecoration(
                  border: Border.all(color:con.selectedIndex.value==1? red:btnGrey),
                  color: con.selectedIndex.value==1? red:white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: subTitleText('Tornado',
                      size: 12,
                      color: con.selectedIndex.value==1? white: black,
                      fontWeight: FontWeight.w600),
                )),
          ),
          GestureDetector(
            onTap: () {
              con.selectedIndex.value=2;
            },
            child: Container(
                height: 40.h,
                width: 95.w,
                decoration: BoxDecoration(
                  border: Border.all(color:con.selectedIndex.value==2? red:btnGrey),
                  color: con.selectedIndex.value==2? red:white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: subTitleText('Premium',
                      size: 12,
                      color: con.selectedIndex.value==2? white: black,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],));

    }
