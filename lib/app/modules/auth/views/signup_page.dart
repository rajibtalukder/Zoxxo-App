import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/modules/auth/controllers/signup_controller.dart';
import 'package:zoxxo/app/modules/auth/views/widgets/build_divider_text.dart';

import '../../../constants/colors.dart';
import '../../../constants/font_constant.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_texts.dart';
import '../../drawer/views/side_drawer.dart';
import 'widgets/build_input_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final SignupController _controller = Get.put(SignupController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      key: scaffoldKey,
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_sharp, color: black)),
        actions: [
          GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(Icons.menu, color: black)),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 24.h),
              // buildTopIcons(),
              // SizedBox(height: 14.h),
              titleText('Sign up', color: black),
              SizedBox(height: 25.h),
              _buildForm(),
              SizedBox(height: 27.h),
              customButton('Create a zoxxo account',
                  color: isDarkMode ? buttonDark : red,
                  textColor: Colors.white,
                  onPressed: _controller.submitSigninForm),
              SizedBox(height: 20.h),
              buildDividerWithText('or'),
              SizedBox(height: 20.h),
              _buildGoogleSignupButton(),
              SizedBox(height: 20.h),
              _buildSignUpOption(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInputField(
            label: 'Name',
            hint: 'Name or company',
            iconPath: 'assets/images/person.png',
            onChanged: (value) => _controller.nameOrCompany.value = value,
            validator: _controller.validateName,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.h),
          buildInputField(
            label: 'Email',
            hint: 'Enter Your Email',
            iconPath: 'assets/images/msgbox.png',
            onChanged: (value) => _controller.email.value = value,
            validator: _controller.validateEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.h),
          buildInputField(
            label: 'Username',
            hint: 'Enter your username',
            iconPath: 'assets/images/person.png',
            onChanged: (value) => _controller.userName.value = value,
            validator: _controller.validateUsername,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.h),
          GetBuilder<SignupController>(
              id: 'passUpdate',
              builder: (con) {
                return Column(
                  children: [
                    buildInputField(
                      label: 'Password',
                      hint: 'Enter Your Password',
                      iconPath: 'assets/images/lock.png',
                      obscureText: con.openEye.value ? false : true,
                      onTapSufIcon: con.showPass,
                      suffixIconPath: con.openEye.value
                          ? 'assets/images/eye_on.png'
                          : 'assets/images/eye.png',
                      onChanged: (value) {
                        _controller.password.value = value;
                        _controller.checkValidate(_controller.password.value);
                        _controller.update(['passUpdate']);
                      },
                      validator: _controller.validatePassword,
                    ),
                    _controller.password.value.isEmpty
                        ? const SizedBox()
                        : Column(
                            children: [
                              SizedBox(height: 10.h),
                              build_validation_row('At least 8 characters long',
                                  con.isCharacter.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Must have one uppercase letter',
                                  con.isUppercase.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Must contain one lowercase letter',
                                  con.isLowercase.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Includes one Number', con.isNum.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Needs one special character',
                                  con.isSpecialChar.value),
                            ],
                          ),
                  ],
                );
              }),
          SizedBox(height: 10.h),
          _buildMultipleTexts(),
        ],
      ),
    );
  }

  Widget build_validation_row(String text, bool isActive) {
    return Row(
      children: [
        Container(
          height: 20.h,
          width: 20.h,
          decoration: BoxDecoration(
            color: isActive ? black : grey.withOpacity(0.6),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Icon(
            Icons.done,
            color: white,
            size: 14,
          ),
        ),
        SizedBox(width: 10.w),
        subTitleText(text, color: isActive ? black : grey, size: 14),
      ],
    );
  }

  Widget _buildMultipleTexts() {
    return Row(
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              _controller.checked.value = !_controller.checked.value;
            },
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: _controller.checked.value ? red : grey),
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
        SizedBox(width: 10.w),
        // subTitleText('Remember me', color: black, fontWeight: FontWeight.w500),
        RichText(
            text: TextSpan(
                text: 'By creating an account, you agree to our'.tr,
                style: TextStyle(
                    color: black, fontWeight: FontWeight.w300, fontSize: 12.sp),
                children: [
              textSpan(' terms of \nservice'),
              textSpan(' and ', isRed: false),
              textSpan(
                'privacy & cookie',
              ),
              textSpan(' statement.', isRed: false),
            ]))
      ],
    );
  }

  TextSpan textSpan(String text, {bool isRed = true}) {
    return TextSpan(
        text: text.tr,
        style: TextStyle(
            color: isRed ? red : black,
            fontWeight: FontWeight.w300,
            fontSize: 12.sp));
  }

  Widget _buildGoogleSignupButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode ? greyBG : btnGrey,
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
            subTitleText('Continue with Google',
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
        subTitleText('Already have an account?  ',
            color: black, size: 14, fontWeight: FontWeight.w400),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: subTitleText('Sign in',
              color: red, size: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
