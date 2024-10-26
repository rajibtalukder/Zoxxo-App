import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/constants/font_constant.dart';
import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_button.dart';
import '../../../../custom_widgets/custom_texts.dart';
import '../../controller/custom_bottomsheet_controller.dart';

Widget bottomSheetNextWidget() {
  return GetBuilder<CustomBottomsheetController>(
      id: 'fileUpdate',
      builder: (controller) {
        return controller.files.isEmpty
            ? SizedBox(height: 58.h)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 140.h,
                    child: Scrollbar(
                      thumbVisibility: true,
                      controller: controller.scrollController1,
                      // Attach ScrollController to Scrollbar
                      child: SingleChildScrollView(
                        controller: controller.scrollController1,
                        // Attach ScrollController to SingleChildScrollView
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            for (int i = 0; i < controller.files.length; i++)
                              pickedFileItem(controller, i)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(Dialog(
                        child: GetBuilder<CustomBottomsheetController>(
                          builder: (controller) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 5.w),
                              height: 500.h,
                              decoration: BoxDecoration(
                                  color: white,
                                  border: Border.all(color: greyLight),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:410.h,
                                      child: Scrollbar(
                                        thumbVisibility: true,
                                        controller: controller.scrollController2,
                                        child: ListView.builder(
                                          controller: controller.scrollController2,
                                          itemCount: controller.files.length,
                                          physics: const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return pickedFileItem2(controller, index);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    customButton('Close',
                                        onPressed: (){
                                          Get.back();
                                        },
                                        width: 100.w,
                                        height: 36.h,
                                        textColor: Colors.white,
                                        color: isDarkMode ? buttonDark : red),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ));
                    },
                    child: Align(
                        alignment: Alignment.center,
                        child: subTitleText('See More',
                            color: black, fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.h),
                        height: 47.h,
                        width: 133.w,
                        decoration: BoxDecoration(
                            color: greyBG,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(color: btnGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customButton('Email',
                                color: controller.isEmailButton.value
                                    ? isDarkMode
                                        ? buttonDark
                                        : red
                                    : greyBG,
                                textColor: controller.isEmailButton.value
                                    ? Colors.white
                                    : isDarkMode
                                        ? Colors.white
                                        : grey,
                                textSize: 14,
                                width: 60.w,
                                height: 37.h, onPressed: () {
                              controller.isEmailButton.value = true;
                              controller.isLinkActive.value = false;
                              controller.update(['fileUpdate']);
                            }),
                            customButton('Link',
                                color: controller.isLinkActive.value
                                    ? isDarkMode
                                        ? buttonDark
                                        : red
                                    : greyBG,
                                textColor: controller.isLinkActive.value
                                    ? Colors.white
                                    : isDarkMode
                                        ? Colors.white
                                        : grey,
                                textSize: 14,
                                width: 60.w,
                                height: 37.h, onPressed: () {
                              controller.isLinkActive.value = true;
                              controller.isEmailButton.value = false;
                              controller.update(['fileUpdate']);
                            }),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      controller.isEmailButton.value
                          ? Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(color: black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: grey
                                              .withOpacity(0.2)), // Not focused
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: grey
                                              .withOpacity(0.2)), // Not focused
                                    ),
                                    hintText: tr('Receiver email*'),
                                    hintStyle: TextStyle(
                                        color: black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onChanged: (v) {},
                                  validator: (g) {
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(height: 10.h),
                                TextFormField(
                                  style: TextStyle(color: black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: grey
                                              .withOpacity(0.2)), // Not focused
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: grey
                                              .withOpacity(0.2)), // Not focused
                                    ),
                                    hintText: tr('Title*'),
                                    hintStyle: TextStyle(
                                        color: black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onChanged: (v) {},
                                  validator: (g) {
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ],
                            )
                          : controller.isLinkActive.value
                              ? Stack(children: [
                                  TextFormField(
                                    style: TextStyle(color: black),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: grey.withOpacity(
                                                0.2)), // Not focused
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: grey.withOpacity(
                                                0.2)), // Not focused
                                      ),
                                      hintText:
                                          'https://www.zoxxo.io/download?uploadld...',
                                      hintStyle: TextStyle(
                                          color: black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    onChanged: (v) {},
                                    validator: (g) {
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  Positioned(
                                    right: 10.w,
                                    top: 10.h,
                                    bottom: 10.h,
                                    child: customButton('Copy',
                                        color: isDarkMode ? buttonDark : red,
                                        textColor: Colors.white,
                                        width: 60.w,
                                        height: 37.h,
                                        textSize: 14, onPressed: () {
                                      Clipboard.setData(const ClipboardData(
                                          text:
                                              'https://www.zoxxo.io/download?uploadld...'));
                                      Get.snackbar('Text copied to clipboard!',
                                          'Successful...',
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: btnGrey);
                                    }),
                                  )
                                ])
                              : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  customButton('Share now',
                      color: isDarkMode ? buttonDark : red,
                      textColor: Colors.white,
                      textSize: 14, onPressed: () {
                    controller.isLinkActive.value = true;
                    controller.update(['fileUpdate']);
                  }),
                  SizedBox(height: 10.h),
                ],
              );
      });
}

Widget pickedFileItem(CustomBottomsheetController controller, int i) {
  return Container(
    height: 52.h,
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    margin: EdgeInsets.only(bottom: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 36.h,
          width: 36.h,
          child: Image.asset("assets/images/jpgIcon.png", color: black),
        ),
        SizedBox(
          width: 216.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subTitleText(controller.fileNames[i],
                  isOverflow: true,
                  size: 12,
                  fontWeight: FontWeight.w500,
                  color: black),
              subTitleText('${controller.fileSizes[i]} MB',
                  size: 12, fontWeight: FontWeight.w500, color: grey),
              const Spacer(),
              Stack(children: [
                Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white : btnGrey,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                //--------The commented slider will works when file upload on server------------
                /* Container(
                                              height: 5.h,
                                              width: 90.w,
                                              decoration: BoxDecoration(
                                                  color: red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                            ),*/
              ]),
              const Spacer(),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            GestureDetector(
              onTap: () {
                controller.files.removeAt(i);
                controller.isLinkActive.value = false;
                controller.update(['fileUpdate']);
              },
              child: SizedBox(
                height: 20.h,
                width: 20.h,
                child:
                    Icon(Icons.close, color: isDarkMode ? Colors.white : grey),
              ),
            ),
            subTitleText('0%',
                color: black, size: 12, fontWeight: FontWeight.w600)
          ],
        )
      ],
    ),
  );
}

Widget pickedFileItem2(CustomBottomsheetController controller, int i) {
  return Container(
    height: 52.h,
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    margin: EdgeInsets.only(bottom: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 36.h,
          width: 36.h,
          child: Image.asset("assets/images/jpgIcon.png", color: black),
        ),
        SizedBox(
          width: 180.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subTitleText(controller.fileNames[i],
                  isOverflow: true,
                  size: 12,
                  fontWeight: FontWeight.w500,
                  color: black),
              subTitleText('${controller.fileSizes[i]} MB',
                  size: 12, fontWeight: FontWeight.w500, color: grey),
              const Spacer(),
              Stack(children: [
                Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white : btnGrey,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                //--------The commented slider will works when file upload on server------------
                /* Container(
                                              height: 5.h,
                                              width: 90.w,
                                              decoration: BoxDecoration(
                                                  color: red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                            ),*/
              ]),
              const Spacer(),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            GestureDetector(
              onTap: () {
                print(i);
                print('----------------------');
                controller.files.removeAt(i);
                controller.isLinkActive.value = false;
                controller.update(['fileUpdate']);
              },
              child: SizedBox(
                height: 20.h,
                width: 20.h,
                child:
                    Icon(Icons.close, color: isDarkMode ? Colors.white : grey),
              ),
            ),
            subTitleText('0%',
                color: black, size: 12, fontWeight: FontWeight.w600)
          ],
        )
      ],
    ),
  );
}
