
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

Widget customTextField(TextEditingController controller,
    {
      bool obscureText = false,
      bool? isValid,
      bool isKeyboardPhone= false,
      IconData? icon,
      IconData? preficon,
      Color? iconColor,
      double? height,
      String? hintText,
      String? errorText,
      bool? isActive,
    }) {
  return Column(
    children: [
      Container(
        height: height?.h??46.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: greyLight,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8.r))
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          child: TextField(
            controller: controller,
            enabled: isActive??true,
            keyboardType:isKeyboardPhone?TextInputType.number: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: black,fontSize: 14.sp),
              fillColor: whiteDeep,
              //contentPadding: EdgeInsets.only(top: 20.h),
              suffixIcon:icon!=null? Icon(icon,color: iconColor??black): const SizedBox(),
              prefixIcon:preficon!=null? Icon(preficon,color: iconColor??black):null,
            ),
            obscureText: obscureText,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
        ),
      ),
      if (isValid != null && !isValid)
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              errorText ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: red,
              ),
            ),
          ),
        ),
    ],
  );
}
