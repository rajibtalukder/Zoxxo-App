import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zoxxo/app/constants/font_constant.dart';
import 'package:zoxxo/app/modules/auth/controllers/new_password_controller.dart';
import 'package:zoxxo/app/modules/auth/views/widgets/build_input_field.dart';

import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_texts.dart';
import '../../drawer/views/side_drawer.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({super.key});
  final NewPasswordController _controller = Get.put(NewPasswordController());
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
              child: Icon(
                Icons.menu,
                color: black,
              )),
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
              // SizedBox(height: 27.h),
              titleText('Create new password', color: black),
              SizedBox(height: 27.h),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 207.h,
                  width: 205.w,
                  child: LottieBuilder.asset(
                    "assets/lottie/reset.json",
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 27.h),
              _buildForm(),
              SizedBox(height: 27.h),
              customButton('Continue',
                  color: isDarkMode ? buttonDark : red,
                  textColor: Colors.white,
                  onPressed: _controller.submitPasswordForm),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _controller.passFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<NewPasswordController>(
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

                  ],
                );
              }),
          SizedBox(height: 12.h),
          GetBuilder<NewPasswordController>(
              id: 'conPassUpdate',
              builder: (con) {
                return Column(
                  children: [
                    buildInputField(
                      label: 'Confirm new Password',
                      hint: 'Enter Your New Password',
                      iconPath: 'assets/images/lock.png',
                      obscureText: con.openEye.value ? false : true,
                      onTapSufIcon: con.showConPass,
                      suffixIconPath: con.openEye.value
                          ? 'assets/images/eye_on.png'
                          : 'assets/images/eye.png',
                      onChanged: (value) {
                        _controller.confirmPassword.value = value;
                        _controller.checkConValidate(
                            _controller.confirmPassword.value);
                        _controller.update(['conPassUpdate']);
                      },
                      validator: _controller.confirmValidatePassword,
                    ),
                    /*_controller.confirmPassword.value.isEmpty
                        ? SizedBox()
                        : Column(
                            children: [
                              SizedBox(height: 10.h),
                              build_validation_row('At least 6 characters long',
                                  con.isConCharacter.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Must have one uppercase letter',
                                  con.isConUppercase.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Must contain one lowercase letter',
                                  con.isConLowercase.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Includes one Number', con.isConNum.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Needs one special character',
                                  con.isConSpecialChar.value),
                              SizedBox(height: 4.h),
                              build_validation_row(
                                  'Password should match',
                                  con.isConPassMatch.value),
                            ],
                          ),*/
                  ],
                );
              }),
          GetBuilder<NewPasswordController>(
            id: 'passUpdate',
                builder: (con) {
                  return _controller.password.value.isEmpty
                      ? const SizedBox()
                      :  Column(
                              children: [
                  SizedBox(height: 10.h),
                  build_validation_row('At least 6 characters long',
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
                            );
                }
              ),
          SizedBox(height: 12.h),
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
        subTitleText(text,
            color: isActive ? black : grey, size: 14),
      ],
    );
  }
}
