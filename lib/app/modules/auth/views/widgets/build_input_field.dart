import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';

Widget buildInputField({
  required String label,
  required String hint,
  required String iconPath,
  bool obscureText = false,
  String? suffixIconPath,
  TextEditingController ? con,
  Function()? onTapSufIcon,
  required Function(String) onChanged,
  required String? Function(String?) validator,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      subTitleText(label, color: black, fontWeight: FontWeight.w500),
      SizedBox(height: 5.h),
      TextFormField(
        controller: con,
        style: TextStyle(
          color: black, // Set the inputted text color
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
                width: 1, color: grey.withOpacity(0.2)), // Not focused
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
                width: 1, color: grey.withOpacity(0.2)), // Not focused
          ),
          filled: true,
          hintText: tr(hint),
          hintStyle: TextStyle(
              color: greyLight, fontSize: 14.sp, fontWeight: FontWeight.w400),
          fillColor: greyBG,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(iconPath, width: 24.h, height: 24.h),
          ),
          suffixIcon: suffixIconPath != null
              ? GestureDetector(
                  onTap: onTapSufIcon,
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(suffixIconPath,color: greyLight, width: 24.h, height: 24.h),
                  ),
              )
              : null,
        ),
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
      ),
    ],
  );
}
