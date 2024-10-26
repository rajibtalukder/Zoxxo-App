import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';

Widget buildDividerWithText(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 140.w,
        child: Divider(height: 1.h, color: greyLight.withOpacity(0.3)),
      ),
      subTitleText(text, color: grey),
      SizedBox(
        width: 140.w,
        child: Divider(height: 1.h, color: greyLight.withOpacity(0.3)),
      ),
    ],
  );
}