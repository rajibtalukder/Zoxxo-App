import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';
import 'custom_texts.dart';

Widget customButton(
    String text, {
      Function()? onPressed,
      double? width,
      double? height,
      double? textSize,
      double? radius,
      color = red,
      required Color textColor,
    }) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
        height:height ?? 48.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius??30.r),
        ),
        child: Center(
          child: subTitleText(text,isOverflow: true, size:textSize?? 16, color: textColor,fontWeight: FontWeight.w500),
        )),
  );
}