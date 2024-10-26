import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';

class HelpItemRow extends StatelessWidget {
  final String question;
  final int index;
  final Function(int) onTap;
  final RxInt selectedIndex;

  const HelpItemRow({
    super.key,
    required this.question,
    required this.index,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 260.w,
              child: titleText(
                question,
                textCenter: false,
                color: black,
                fontWeight: FontWeight.w400,
                size: 14,
              ),
            ),
            GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                height: 24.w,
                width: 24.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: selectedIndex.value == index ? red : black,
                ),
                child: Icon(
                  selectedIndex.value == index ? Icons.close : Icons.add,
                  color: white,
                  size: 18,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        selectedIndex.value == index
            ? globalSubtextForTap() // Or you can pass in a custom widget to display here
            : SizedBox(
          width: double.infinity,
          child: Divider(height: 1, color: black),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
  Widget globalSubtextForTap() {
    return subTitleText(
        'Yes, you can just visist zoxxo.io and upload your '
            'data upto 2 GB and share it with your friends, family '
            'and others.',
        textCenter: false,
        color: black,
        size: 12);
  }
}
