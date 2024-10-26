import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zoxxo/app/modules/auth/controllers/forgot_controller.dart';
import 'package:zoxxo/app/modules/auth/views/widgets/build_input_field.dart';
import '../../../constants/colors.dart';
import '../../../constants/font_constant.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_texts.dart';
import '../../drawer/views/side_drawer.dart';

class ForgotPage extends StatelessWidget {
   ForgotPage({super.key});
  final ForgotController _controller = Get.put(ForgotController());
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
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_sharp, color: black)),
        actions: [
          GestureDetector(
              onTap: (){
                scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(Icons.menu, color: black)),
          SizedBox(width: 20.w,)
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
              titleText('Forgot password', color: black),
              SizedBox(height: 64.h),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 187.h,
                  width: 282.w,
                  child: LottieBuilder.asset(
                    "assets/lottie/forgot-password.json",
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 47.h),
              Form(
                key: _controller.forgotFormKey,
                child: Column(
                  children: [
                    buildInputField(
                      label: 'Email',
                      hint: 'Enter Your Email',
                      iconPath: 'assets/images/msgbox.png',
                      onChanged: (value) => _controller.email.value = value,
                      validator: _controller.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 27.h),
                    customButton('Send reset email',color: isDarkMode ? buttonDark : red,
                        textColor: Colors.white, onPressed: _controller.submitForgotForm),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  subTitleText('Already have an account?  ',
                      color: black, size: 14, fontWeight: FontWeight.w400),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: subTitleText('Sign in',
                        color: red, size: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
