import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/custom_widgets/custom_button.dart';
import 'package:zoxxo/app/modules/auth/views/new_password_page.dart';

import '../../../constants/colors.dart';
import '../../../constants/font_constant.dart';
import '../../../custom_widgets/custom_texts.dart';
import '../controllers/forgot_controller.dart';

class ForgotVerifyPage extends StatelessWidget {
  ForgotVerifyPage({super.key});

  final ForgotController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    _controller.isTextFilled.value = false;
    _controller.timer?.cancel();
    _controller.seconds.value = 50;
    _controller.startTimer();
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: black,
                    )),
                SizedBox(height: 20.h),
                titleText('Forgot password', color: black),
                SizedBox(height: 58.h),
                subTitleText('Code has been sent to john***gmail.com',
                    fontWeight: FontWeight.w400, size: 14, color: black),
                SizedBox(height: 42.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (i) {
                    return Container(
                      height: 50.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: isDarkMode ? greyBG : btnGrey,
                      ),
                      child: TextField(
                        autofocus: i == 0,
                        onChanged: (value) {
                          if (value.length == 1 && value.length < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (i == 3) {
                            _controller.isTextFilled.value = true;
                          }
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 24.sp, color: black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 76.h),
                Align(
                  alignment: Alignment.center,
                  child: _controller.seconds.value.toString() != '0'
                      ? RichText(
                          text: TextSpan(
                              text: 'Resend code in ',
                              style: secondaryTextStyle(
                                  14.sp, black, FontWeight.w400),
                              children: [
                              TextSpan(
                                  text: _controller.seconds.value.toString(),
                                  style: secondaryTextStyle(
                                      14.sp, red, FontWeight.w400)),
                              TextSpan(
                                  text: ' s',
                                  style: secondaryTextStyle(
                                      14.sp, black, FontWeight.w400)),
                            ]))
                      : GestureDetector(
                          onTap: () {
                            _controller.timer?.cancel();
                            _controller.seconds.value = 50;
                            _controller.startTimer();
                          },
                          child: subTitleText('Send code again',
                              fontWeight: FontWeight.w400,
                              color: red,
                              size: 14),
                        ),
                ),
                SizedBox(height: 25.h),
                customButton('Verify',
                    textColor:
                        _controller.isTextFilled.value ? Colors.white : txtGrey,
                    color: _controller.isTextFilled.value
                        ? (isDarkMode ? buttonDark : red)
                        : (isDarkMode ? Colors.white : btnGrey), onPressed: () {
                  if (_controller.isTextFilled.value) {
                    Get.to(() => NewPasswordPage());
                  } else {
                    return null;
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
