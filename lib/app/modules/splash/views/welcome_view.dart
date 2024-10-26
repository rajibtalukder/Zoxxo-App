import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoxxo/app/custom_widgets/custom_button.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';

import '../../../constants/colors.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 48.h),
              titleText('Welcome to ZOXXO!', color: black),
              SizedBox(height: 95.h),
              SizedBox(
                height: 236.h,
                width: 268.w,
                child: Image.asset(
                  "assets/images/welcome.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 95.h),
              subTitleText(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', color: grey,
              ),
              SizedBox(height: 77.h),
              customButton('Register',textColor: white),
              SizedBox(height: 16.h),
              Container(
                  height: 48.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: subTitleText('Login',
                        size: 16, color: red, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
