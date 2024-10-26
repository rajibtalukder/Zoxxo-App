import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';
import '../../../home/views/widgets/build_process_icon.dart';
import '../../controller/custom_bottomsheet_controller.dart';

Widget progressIndicatorWidget() {
  return SizedBox(
    width: 230.w,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Stack(
        children: [
          Positioned(
            top: 13.h,
            left: 10.w,
            child:GetBuilder<CustomBottomsheetController>(
              id: 'fileUpdate',
              builder: (con) {
                return SizedBox(
                        width: 70.w,
                        child: Divider(height: 1.h, color:con.files.isEmpty?btnGrey:red ));
              }
            )

          ),
          Positioned(
            top: 13.h,
            right: 10.w,
            child: SizedBox(
                width: 70.w,
                child: Divider(height: 1.h, color: btnGrey)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  buildProcessIcon("assets/images/upload.png",
                      isActive: true),
                  subTitleText('Upload',
                      color: black,
                      size: 8,
                      fontWeight: FontWeight.w500)
                ],
              ),
              GetBuilder<CustomBottomsheetController>(
                  id: 'fileUpdate',
                  builder: (con) {
                    return Column(
                      children: [
                        buildProcessIcon("assets/images/share.png",
                            isActive:con.files.isEmpty? false:true),
                        subTitleText('Share',
                            color: black,
                            size: 8,
                            fontWeight: FontWeight.w500)
                      ],
                    );
                  }
              ),
              Column(
                children: [
                  buildProcessIcon("assets/images/enjoy.png",
                      isActive: false),
                  subTitleText('Enjoy',
                      color: black,
                      size: 8,
                      fontWeight: FontWeight.w500)
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}