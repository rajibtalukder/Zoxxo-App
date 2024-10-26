import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/modules/pricing/controllers/pricing_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../custom_widgets/custom_texts.dart';

Row monthYearChangeWidget( PricingController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      subTitleText('Monthly',
          color: black, size: 12, fontWeight: FontWeight.w500),
      SizedBox(width: 10.w),
      Obx(()=> Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
            activeColor: red,
            trackColor: black.withOpacity(0.8),
            value: controller.isYear.value,
            onChanged: (value) {
              controller.changeToggle();
            },
          ),
      ),
      ),
      SizedBox(width: 10.w),
      subTitleText('Yearly',
          color: black, size: 12, fontWeight: FontWeight.w500),
    ],
  );
}