import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/modules/auth/views/forgot_verify_page.dart';

class ForgotController extends GetxController{

  var email = ''.obs;
  final GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();

  // Validation Email----
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // form submisson----
  void submitForgotForm() {
    if (forgotFormKey.currentState!.validate()) {
      Get.to(()=>ForgotVerifyPage());
    }
  }

  //-------------Forgot Verification Controller

  RxBool isTextFilled = false.obs;
  var seconds = 50.obs;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }



}