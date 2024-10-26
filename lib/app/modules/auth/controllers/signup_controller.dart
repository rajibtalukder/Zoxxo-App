import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_service/api_client.dart';
import '../../../api_service/api_exception.dart';
import '../../../custom_widgets/Utils.dart';
import '../models/signup_model.dart';

class SignupController extends GetxController {
  var nameOrCompany = ''.obs;
  var email = ''.obs;
  var userName = ''.obs;
  var password = ''.obs;
  RxBool checked = false.obs;
  RxBool openEye = false.obs;

  //validation boolean variables---
  RxBool isCharacter = false.obs;
  RxBool isUppercase = false.obs;
  RxBool isLowercase = false.obs;
  RxBool isNum = false.obs;
  RxBool isSpecialChar = false.obs;

  bool checkValidate(String value) {
    isCharacter.value = value.length > 7;
    isUppercase.value = RegExp(r'^(?=.*[A-Z])').hasMatch(value);
    isLowercase.value = RegExp(r'^(?=.*[a-z])').hasMatch(value);
    isNum.value = RegExp(r'^(?=.*[0-9])').hasMatch(value);
    isSpecialChar.value = RegExp(r'^(?=.*[@$#!%*?&])').hasMatch(value);
    update(['passUpdate']);
    return isCharacter.value &&
        isUppercase.value &&
        isLowercase.value &&
        isNum.value &&
        isSpecialChar.value;
  }

  void showPass() {
    openEye.value = !openEye.value;
    update(['passUpdate']);
  }

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Validation Name----
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name or company';
    }
    return null;
  }

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

  // Validation Username----
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  //Validation Password----
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // uppercase letter
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // lowercase letter
    if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // one number
    if (!RegExp(r'^(?=.*[0-9])').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    // one special character
    if (!RegExp(r'^(?=.*[@$#!%*?&])').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  // form submisson----
  void submitSigninForm() {
    if (signupFormKey.currentState!.validate()) {
      signUpUser();
    }
  }

//api connection----------
  SignupModel userRegister = SignupModel();

  Future<void> signUpUser() async {
    try {
      Utils.showLoading();
      var response = await ApiClient().post('auth/register', {
        "fullName": nameOrCompany.value,
        "email": email.value,
        "username": userName.value,
        "password": password.value
      });
      var jsonResponse = jsonDecode(response);
      userRegister = SignupModel.fromJson(jsonResponse);
      Utils.hidePopup();
      Get.back();
      Utils.showSnackBar(
          title: "Sign up successful",
          "Please check your email to verify your account");
    } on BadRequestException catch (e) {
      final Map<String, dynamic> errorMap = jsonDecode(e.message);
      Utils.hidePopup();
      Utils.showSnackBar(errorMap['message']);
    } on UnAuthorizedException catch (e) {
      final Map<String, dynamic> errorMap = jsonDecode(e.message);
      Utils.hidePopup();
      Utils.showSnackBar(errorMap['message']);
    } on ProcessDataException catch (e) {
      final Map<String, dynamic> errorMap = jsonDecode(e.message);
      Utils.hidePopup();
      Utils.showSnackBar(errorMap['message']);
    } catch (e) {
      Utils.hidePopup();
      Utils.showSnackBar("Unexpected error: ${e.toString()}");
    }
  }
}
