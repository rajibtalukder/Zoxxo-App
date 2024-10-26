import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/custom_widgets/Utils.dart';
import 'package:zoxxo/app/modules/auth/models/signin_model.dart';
import 'package:zoxxo/app/modules/profile/views/profile_page.dart';

import '../../../api_service/api_client.dart';
import '../../../api_service/api_exception.dart';

class SigninController extends GetxController {
  //Login logic----
  SigninModel user = SigninModel();

  Future<void> signinUser() async {
    try {
      Utils.showLoading();
      var response = await ApiClient().post(
        'auth/login',
        {"email": email.value, "password": password.value},
      );
      emailController.clear();
      passController.clear();
      var jsonResponse = jsonDecode(response);
      user = SigninModel.fromJson(jsonResponse);
      Utils.hidePopup();
      Get.to(ProfilePage());
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


  //logout logic----
  Future<void> signOut() async {
    try {
      Utils.showLoading();
      var response = await ApiClient().get('auth/logout');
      var jsonResponse = jsonDecode(response);
      print(jsonResponse);
      Utils.hidePopup();
      Get.back();
      Utils.showSnackBar(title: 'Logout', jsonResponse['message']);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  var email = ''.obs;
  var password = ''.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passController.dispose();
  //   super.onClose();
  // }

  RxBool checked = false.obs;
  RxBool openEye = false.obs;

  void showPass() {
    openEye.value = !openEye.value;
    update(['passUpdate']);
  }

  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

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

  //Validation Password----
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // form submisson----
  Future<void> submitSigninForm() async {
    if (signinFormKey.currentState!.validate()) {
      await signinUser();
    }
  }
}
