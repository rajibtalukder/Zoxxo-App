import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/custom_widgets/custom_button.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';
import 'package:zoxxo/app/modules/drawer/controller/side_drawer_controller.dart';
import 'package:zoxxo/app/modules/drawer/views/advertising_page.dart';
import 'package:zoxxo/app/modules/drawer/views/brand_page.dart';
import 'package:zoxxo/app/modules/help_privacy/views/help_center.dart';
import 'package:zoxxo/app/modules/help_privacy/views/privacy_policy.dart';
import 'package:zoxxo/app/modules/help_privacy/views/terms_service.dart';
import '../../../constants/font_constant.dart';
import 'platform_page.dart';
import 'widgets/custom_small_modal.dart';
import 'widgets/stroage_box_widget.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({super.key});
  final SideDrawerController _controller = Get.put(SideDrawerController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 297.w,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      backgroundColor: white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 20.h),
        child: Column(
          children: [
            _buildDrawerHeader(),
            SizedBox(height: 20.h),
            Divider(height: 1, color: btnGrey),
            SizedBox(height: 20.h),
            GetBuilder<SideDrawerController>(
                id: 'updateExpand',
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      context.expandWidget();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitleText('Zoxxo space',
                            color: black,
                            fontWeight: FontWeight.w500,
                            size: 16),
                        context.isExpanded.value
                            ? Icon(Icons.arrow_drop_up, color: black, size: 38)
                            : Icon(Icons.arrow_drop_down,
                                color: black, size: 38)
                      ],
                    ),
                  );
                }),
            GetBuilder<SideDrawerController>(
                id: 'updateExpand',
                builder: (context) {
                  return context.isExpanded.value
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            children: [
                              SizedBox(height: 30.h),
                              GestureDetector(
                                onTap: () {
                                  Get.to(PlatformPage());
                                },
                                child: _buildDrawerItem(
                                  imagePath: 'assets/images/Platform.png',
                                  label: 'Platform',
                                ),
                              ),
                              SizedBox(height: 30.h),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>AdvertisingPage());
                                },
                                child: _buildDrawerItem(
                                  imagePath: 'assets/images/Ad.png',
                                  label: 'Advertising',
                                ),
                              ),
                              SizedBox(height: 30.h),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>BrandPage());
                                },
                                child: _buildDrawerItem(
                                  imagePath: 'assets/images/Brand.png',
                                  label: 'Brand',
                                ),
                              ),
                              SizedBox(height: 30.h),
                              _buildDrawerItem(
                                imagePath: 'assets/images/monetization.png',
                                label: 'Monetization',
                              ),
                            ],
                          ),
                        )
                      : const SizedBox();
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  _buildDrawerItemWithWidget(
                    imagePath: 'assets/images/language.png',
                    label: 'Language',
                    widget: GestureDetector(
                      onTap: () async {
                        Get.dialog(CustomSmallModal());
                      },
                      child: Container(
                        height: 25.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          color: greyBG,
                          border: Border.all(color: btnGrey),
                          borderRadius: BorderRadius.circular(46.r),
                        ),
                        child: Center(
                          child: Localizations.localeOf(context).languageCode ==
                                  'en'
                              ? subTitleText('EN',
                                  color: black,
                                  fontWeight: FontWeight.w600,
                                  size: 12)
                              : subTitleText('DE',
                                  color: black,
                                  fontWeight: FontWeight.w600,
                                  size: 12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  _buildDrawerItemWithWidget(
                      imagePath: 'assets/images/moon.png',
                      label: 'Dark mode',
                      widget: Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          activeColor: red,
                          value: isDarkMode,
                          onChanged: (value) {
                            _controller.changeTheme();
                          },
                        ),
                      )),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(8.w),
              height: 60.h,
              width: 258.w,
              decoration: BoxDecoration(
                  color: greyBG,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: btnGrey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton('Sign in',
                      color: greyBG,
                      textColor: grey,
                      textSize: 16,
                      width: 106.w,
                      height: 43.h),
                  customButton(
                      textColor: Colors.white,
                      'Sign up',
                      width: 106.w,
                      height: 43.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            stroageBoxWidget(),
            SizedBox(height: 20.h),
            SizedBox(
                width: double.infinity,
                child: Divider(height: 1, color: btnGrey)),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const PrivacyPolicy());
                  },
                  child: SizedBox(
                    width: 80.w,
                    child: subTitleText('Privacy policy',
                        isOverflow: true,
                        color: black,
                        size: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const TermsService());
                  },
                  child: SizedBox(
                    width: 80.w,
                    child: subTitleText('Terms of service',
                        isOverflow: true,
                        color: black,
                        size: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(HelpCenter());
                  },
                  child: SizedBox(
                    width: 80.w,
                    child: subTitleText('Help center',
                        isOverflow: true,
                        color: black,
                        size: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawerHeader() {
  return Row(
    children: [
      Image.asset(
        "assets/images/splash_logo.png",
        height: 30.h,
        width: 34.w,
        color: red,
      ),
      SizedBox(width: 5.w),
      subTitleText('Zoxxo',
          size: 16, fontWeight: FontWeight.w700, color: black),
      const Spacer(),
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.close, color: black),
      ),
    ],
  );
}

Widget _buildDrawerItem({required String imagePath, required String label}) {
  return Row(
    children: [
      Image.asset(imagePath,
          color: black.withOpacity(0.8), height: 20.h, width: 20.h),
      SizedBox(width: 14.w),
      subTitleText(label, size: 16, fontWeight: FontWeight.w400, color: black),
      const Spacer(),
    ],
  );
}

Widget _buildDrawerItemWithWidget({
  required String imagePath,
  required String label,
  required Widget widget,
}) {
  return Row(
    children: [
      Image.asset(imagePath,
          color: black.withOpacity(0.8), height: 20.h, width: 20.h),
      SizedBox(width: 14.w),
      subTitleText(label, size: 16, fontWeight: FontWeight.w400, color: black),
      const Spacer(),
      widget,
    ],
  );
}
