import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';
import '../../../../constants/colors.dart';

Widget pricingBottomSheetWidget() {
  return Container(
    width: double.infinity,
    height: 703.h,
    padding: EdgeInsets.all(10.w),
    child: Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 3.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: greyLight.withOpacity(0.5)),
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180.w,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: titleText('Send big files',
                          color: black, fontWeight: FontWeight.w600, size: 18),
                    ),
                  ),
                  Column(
                    children: [
                      subTitleText('Forever free',
                          color: black, size: 16, fontWeight: FontWeight.w500),
                      Row(
                        children: [
                          subTitleText('\$0 ',
                              color: black, size: 16, fontWeight: FontWeight.w500),
                          subTitleText('per month',
                              color: grey, size: 14, fontWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Divider(
                height: 1, color: greyLight.withOpacity(0.6),
              ),
              SizedBox(height: 20.h),
              itemRow(
                  'Transfer size limit',
                  subTitleText('2GB',
                      color: txtGrey, fontWeight: FontWeight.w400, size: 12)),
              itemRow(
                  'Storage',
                  subTitleText('4GB',
                      color: txtGrey, fontWeight: FontWeight.w400, size: 12)),
              itemRow(
                  'Workspaces',
                  subTitleText('1 Workspaces',
                      color: txtGrey, fontWeight: FontWeight.w400, size: 12)),
              itemRow('Download with no account',
                  Icon(Icons.done, color: txtGrey, size: 18)),
              itemRow(
                  'Track downloads', Icon(Icons.done, color: txtGrey, size: 18)),
              titleText('Show off your brand',
                  color: black, fontWeight: FontWeight.w600, size: 18),
              SizedBox(height: 10.h),
              Divider(
                height: 1, color: greyLight.withOpacity(0.6),
              ),
              SizedBox(height: 20.h),
              itemRow('Custom download page',
                  Icon(Icons.close, color: txtGrey, size: 18)),
              itemRow(
                  'Wallpaper backgrounds',
                  subTitleText('Advertising (and art)',
                      color: txtGrey, fontWeight: FontWeight.w400, size: 12)),
              itemRow('Custom workspace image',
                  Icon(Icons.close, color: txtGrey, size: 18)),
              titleText('Secure your transfer',
                  color: black, fontWeight: FontWeight.w600, size: 18),
              SizedBox(height: 10.h),
              Divider(
                height: 1, color: greyLight.withOpacity(0.6),
              ),
              SizedBox(height: 20.h),
              itemRow('Custom expiration date',
                  Icon(Icons.close, color: txtGrey, size: 18)),
              itemRow('Password protected transfers',
                  Icon(Icons.close, color: txtGrey, size: 18)),
              itemRow(
                  'Data encryption', Icon(Icons.close, color: txtGrey, size: 18)),
            ]),
          )),
    ),
  );
}

Widget itemRow(String text, Widget widget) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        subTitleText(text, color: black, fontWeight: FontWeight.w400, size: 14),
        widget
      ],
    ),
  );
}
