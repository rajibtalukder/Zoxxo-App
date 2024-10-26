import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';

class LandingView1 extends StatelessWidget {
  const LandingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 48.h),
              SizedBox(
                height: 236.h,
                width: 268.w,
                child: LottieBuilder.asset(
                  "assets/lottie/file-transfer-animation.json",
                  //fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 108.h),
              titleText('We don’t transfer we deliver',color: black),
              SizedBox(height: 20.h),
              subTitleText(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', color: grey,
              ),
              /*SizedBox(height: 24.h),
                SizedBox(
                  width: 46.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 7.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                            color: red, borderRadius: BorderRadius.circular(8.r)),
                      ),
                      Container(
                        height: 7.h,
                        width: 7.h,
                        decoration: BoxDecoration(
                            color: grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50.r)),
                      ),
                      Container(
                        height: 7.h,
                        width: 7.h,
                        decoration: BoxDecoration(
                            color: grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50.r)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 152.h),
                SizedBox(
                  height: 36.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText('Skip', color: red, fontWeight: FontWeight.w500),
                      customButton('Next',width: 86.w, onPressed: (){
                        Get.to(()=>LandingView2(),transition: Transition.rightToLeftWithFade,);
                      })
                    ],
                  ),
                )*/
            ],
          ),
        ),
      ),
    );
  }
}