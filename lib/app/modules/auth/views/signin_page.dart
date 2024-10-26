import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/custom_widgets/custom_button.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';
import 'package:zoxxo/app/modules/auth/controllers/signin_controller.dart';
import 'package:zoxxo/app/modules/auth/views/forgot_page.dart';
import 'package:zoxxo/app/modules/auth/views/signup_page.dart';
import 'package:zoxxo/app/modules/auth/views/widgets/build_divider_text.dart';

import '../../../constants/font_constant.dart';
import 'widgets/build_input_field.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final SigninController _controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText('Sign in', color: black),
            SizedBox(height: 25.h),
            _buildForm(),
            SizedBox(height: 27.h),
            customButton('Login to your zoxxo account',color: isDarkMode? buttonDark:red,
                textColor: Colors.white, onPressed:
                (){
                  _controller.submitSigninForm();
                }
                ),
            SizedBox(height: 33.h),
            buildDividerWithText('or'),
            SizedBox(height: 33.h),
            _buildGoogleLoginButton(),
            SizedBox(height: 20.h),
            _buildSignUpOption(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _controller.signinFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInputField(
            con: _controller.emailController,
            label: 'Email',
            hint: 'Enter Your Email',
            iconPath: 'assets/images/msgbox.png',
            onChanged: (value) => _controller.email.value = value,
            validator: _controller.validateEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.h),
          GetBuilder<SigninController>(
              id: 'passUpdate',
              builder: (con) {
                return buildInputField(
                  con: _controller.passController,
                  label: 'Password',
                  hint: 'Enter Your Password',
                  iconPath: 'assets/images/lock.png',
                  obscureText: con.openEye.value ? false : true,
                  onTapSufIcon: con.showPass,
                  suffixIconPath: con.openEye.value
                      ? 'assets/images/eye_on.png'
                      : 'assets/images/eye.png',
                  onChanged: (value) => _controller.password.value = value,
                  validator: _controller.validatePassword,
                );
              }),
          SizedBox(height: 10.h),
          _buildRememberMeRow(),
        ],
      ),
    );
  }

  Widget _buildRememberMeRow() {
    return Row(
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              _controller.checked.value = !_controller.checked.value;
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: _controller.checked.value ? red : grey),
                  color: _controller.checked.value ? red : null,
                  borderRadius: BorderRadius.circular(5.r)),
              height: 24.h,
              width: 24.h,
              child: _controller.checked.value
                  ? const Icon(Icons.done, color: Colors.white, size: 18)
                  : const SizedBox(),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        subTitleText('Remember me', color: black, fontWeight: FontWeight.w500),
        const Expanded(child: SizedBox()),
        GestureDetector(
          onTap: () {
            Get.to(() => ForgotPage());
          },
          child: subTitleText('Forgot password?',isOverflow: true,
              color: black, size: 13, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildGoogleLoginButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode?greyBG: btnGrey,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.h,
              width: 24.h,
              child: Image.asset('assets/images/Google.png'),
            ),
            SizedBox(width: 16.w),
            subTitleText('Login with Google',
                size: 16.sp, color: txtGrey, fontWeight: FontWeight.w400),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        subTitleText('Don’t have an account?  ',
            color: black, size: 14, fontWeight: FontWeight.w400),
        GestureDetector(
          onTap: () {
            Get.to(() => SignupPage());
          },
          child: subTitleText('Sign up',
              color: red, size: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
