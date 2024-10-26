import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';

Widget buildProcessIcon(String iconAssetsName, {bool isActive = false}) {
  return Container(
    height: 26.h,
    width: 26.h,
    decoration: BoxDecoration(
        color: isActive ? red : btnGrey,
        borderRadius: BorderRadius.circular(20.r)),
    child: Center(
      child: SizedBox(
        height: 12.h,
        width: 12.h,
        child: Image.asset(
          iconAssetsName,
        ),
      ),
    ),
  );
}