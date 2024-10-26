import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Utils {
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(5.r), // Set the border radius to 5.r
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  static void hidePopup() {
    Get.back();
  }

  static void showSnackBar(String message, {String? title, Color? color}) {
    Get.snackbar(
      title ?? 'Error',
      duration: const Duration(seconds: 4),
      message.length < 50 ? message : message.substring(0, 50),
      backgroundColor: color ?? Colors.black,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      titleText: title != null
          ? Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            )
          : null,
      margin: const EdgeInsets.all(0), // Optional margin
      borderRadius: 4, // Rounded corners for better appearance
    );
  }
}
