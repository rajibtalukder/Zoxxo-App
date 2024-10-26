import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/font_constant.dart';



Widget titleText(String text,
    {double size = 28,
       required Color color ,
      bool textCenter = true,
      FontWeight fontWeight = FontWeight.w600,
    }) {
  return Text(
    tr(text),
    textAlign: textCenter?TextAlign.center: TextAlign.start,
    style: primaryTextStyle(
      size.sp,
      color,
      fontWeight,
    ),
  );
}

Widget subTitleText(String text,
    {double size = 16,
      required Color color ,
      FontWeight fontWeight = FontWeight.w300,
      bool textCenter =true,
      bool isOverflow =false
    }) {
  return Text(
      tr(text),
    overflow:isOverflow? TextOverflow.ellipsis: null,
    textAlign: textCenter?TextAlign.center: TextAlign.start,
    style:  secondaryTextStyle(isOverflow? size.sp-1.sp:size.sp,
      color,
      fontWeight)
  );
}