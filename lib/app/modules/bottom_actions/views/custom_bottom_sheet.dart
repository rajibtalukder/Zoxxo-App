import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';
import 'package:zoxxo/app/modules/bottom_actions/views/widgets/progress_indicator_widget.dart';
import '../../../constants/font_constant.dart';
import '../controller/custom_bottomsheet_controller.dart';
import 'widgets/bottom_sheet_next_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});

  final CustomBottomsheetController _controller =
      Get.put(CustomBottomsheetController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3.h,
              width: 64.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: greyLight.withOpacity(0.5)),
            ),
            SizedBox(height: 28.h),
            GestureDetector(
              onTap: _controller.pickFiles,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 160.h,
                      width: 160.h,
                      decoration: BoxDecoration(
                          boxShadow: isDarkMode?null: [
                            BoxShadow(
                              color: greyBG.withOpacity(0.8),
                              spreadRadius: 10,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          color: isDarkMode? greyBGDark: white,
                          borderRadius: BorderRadius.circular(500.r)),
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    bottom: 10.h,
                    left: 10.h,
                    right: 10.h,
                    child: Center(
                      child: Container(
                        height: 125.h,
                        width: 125.h,
                        decoration: BoxDecoration(
                            boxShadow: [
                               BoxShadow(
                                color: greyBG.withOpacity(0.8),
                                spreadRadius: 10,
                                blurRadius: 10,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            color: isDarkMode? buttonDark: white,
                            borderRadius: BorderRadius.circular(500.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 22.h,
                              width: 32.w,
                              child:
                              Image.asset("assets/images/upload_icon.png"),
                            ),
                            SizedBox(height: 12.h),
                            subTitleText('Click here to upload',
                                size: 10,
                                fontWeight: FontWeight.w500,
                                color: black)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            progressIndicatorWidget(),
            bottomSheetNextWidget(),
          ],
        ),
      ),
    );
  }



}
