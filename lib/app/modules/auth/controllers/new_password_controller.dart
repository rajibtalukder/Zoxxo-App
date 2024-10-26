import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottom_actions/views/bottom_navigation_bar_page.dart';

class NewPasswordController extends GetxController{
  var password = ''.obs;
  var confirmPassword = ''.obs;
  RxBool openEye = false.obs;
  void showPass(){
    openEye.value =! openEye.value;
    update(['passUpdate']);
  }
  void showConPass(){
    openEye.value =! openEye.value;
    update(['conPassUpdate']);
  }

  //validation boolean variables---
  RxBool isCharacter = false.obs;
  RxBool isUppercase = false.obs;
  RxBool isLowercase = false.obs;
  RxBool isNum = false.obs;
  RxBool isSpecialChar = false.obs;

  bool checkValidate(String value) {
    isCharacter.value = value.length > 5;
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
  //validation boolean variables---
  RxBool isConCharacter = false.obs;
  RxBool isConUppercase = false.obs;
  RxBool isConLowercase = false.obs;
  RxBool isConNum = false.obs;
  RxBool isConSpecialChar = false.obs;
  RxBool isConPassMatch = false.obs;

  bool checkConValidate(String value) {
    isConCharacter.value = value.length > 5;
    isConUppercase.value = RegExp(r'^(?=.*[A-Z])').hasMatch(value);
    isConLowercase.value = RegExp(r'^(?=.*[a-z])').hasMatch(value);
    isConNum.value = RegExp(r'^(?=.*[0-9])').hasMatch(value);
    isConSpecialChar.value = RegExp(r'^(?=.*[@$#!%*?&])').hasMatch(value);
    isConPassMatch.value = (password == confirmPassword);
    update(['conPassUpdate']);
    return isConCharacter.value &&
        isConUppercase.value &&
        isConUppercase.value &&
        isLowercase.value &&
        isConUppercase.value &&
        isNum.value &&
        isConUppercase.value &&
        isSpecialChar.value &&
        isConPassMatch.value;
  }

  final GlobalKey<FormState> passFormKey = GlobalKey<FormState>();


  //Validation Password----
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  //Confirm Validation Password----
  String? confirmValidatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if( value != password.value){
      return 'Password not matched';
    }
    return null;
  }


  // form submisson----
  void submitPasswordForm() {
    if (passFormKey.currentState!.validate()) {
      Get.offAll(BottomNavigationBarPage());
    }
  }

}