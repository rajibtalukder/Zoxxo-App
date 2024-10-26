import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/constants/font_constant.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';

import '../../../../custom_widgets/custom_button.dart';
import '../../../../local_storage/shared_pref.dart';

class CustomSmallModal extends StatelessWidget {
  const CustomSmallModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(

        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
            color: white,
          border: Border.all(color: greyLight)
        ),
        width: 80.w,
        height: 230.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subTitleText("Select Language",
                color: black, size: 16, fontWeight: FontWeight.w500),
            GestureDetector(
              onTap: () async {
                Locale newLocale = const Locale('en');
                await context.setLocale(newLocale);
                Get.updateLocale(newLocale);
                Get.forceAppUpdate();
                Get.back();
                isLangCheck=true;
                await SharedPref()
                    .saveValue('lang', isLangCheck);
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: context.locale.languageCode == 'en'
                        ? Border.all(color: red)
                        : null),
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    context.locale.languageCode == 'en'
                        ? const Icon(Icons.done, color: red, size: 20)
                        : SizedBox(width: 20.w),
                    SizedBox(width: 30.w),
                    subTitleText('English',
                        color: black, fontWeight: FontWeight.w400)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Locale newLocale = const Locale('de');
                await context.setLocale(newLocale);
                Get.updateLocale(newLocale);
                Get.forceAppUpdate();
                Get.back();
                isLangCheck=true;
                await SharedPref()
                    .saveValue('lang', isLangCheck);
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: context.locale.languageCode == 'de'
                        ? Border.all(color: red)
                        : null),
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    context.locale.languageCode == 'de'
                        ? const Icon(Icons.done, color: red, size: 20)
                        : SizedBox(width: 20.w),
                    SizedBox(width: 30.w),
                    subTitleText('Deutsch',
                        color: black, fontWeight: FontWeight.w400)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: customButton('Close', onPressed: () {
                Get.back();
              }, textColor: Colors.white, width: 90.w, height: 34.h),
            )
          ],
        ),
      ),
    );
  }
}
