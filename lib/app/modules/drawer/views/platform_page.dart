import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zoxxo/app/custom_widgets/custom_button.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';
import 'package:zoxxo/app/modules/drawer/views/read_article_page.dart';

import '../../../constants/colors.dart';
import 'side_drawer.dart';

class PlatformPage extends StatelessWidget {
  PlatformPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      key: scaffoldKey,
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, color: black, size: 20)),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(Icons.menu, color: black)),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
              child: Container(
                height: 162.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: black,
                  image: const DecorationImage(
                      image: AssetImage("assets/images/PlatformImg.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.4),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 260.w,
                      child: titleText('Hello world we are here to deliver!',
                          color: white, fontWeight: FontWeight.w700, size: 24),
                    ),
                    SizedBox(height: 25.h),
                    customButton('Read article',
                        onPressed: (){
                          Get.to(ReadArticlePage());
                        },
                        textColor: white,
                        width: 100.w,
                        textSize: 12,
                        height: 33,
                        radius: 5.r)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: titleText("We don't transfer, we deliver!",
                  color: black, size: 18),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 160.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    rowItem(
                        "assets/images/upCloud.svg",
                        'Upload your data',
                        'zoxxo is a modern platform to upload your data '
                            'anonymus, secure and fast.'),
                    rowItem(
                        "assets/images/shareIcon.svg",
                        'Share with others!',
                        'Share your uploaded data and ideas with your'
                            ' friends, family and others!'),
                    rowItem(
                        "assets/images/fileSetting.svg",
                        'Manage your uploads',
                        'zoxxo Manage provides an easy way '
                            'to manage your uploads in Workspaces.'),
                    SizedBox(width: 20.w)
                  ],
                ),
              ),
            ),
            SizedBox(height: 35.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              height: 144.h,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: btnGrey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: LottieBuilder.asset(
                "assets/lottie/brand-page.json",
                //fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText("Present your brand to a huge community of gamers!",
                      color: black,
                      size: 26,
                      fontWeight: FontWeight.w500,
                      textCenter: false),
                  SizedBox(height: 15.h),
                  subTitleText('• Place your Ads on up-or download screen',
                      fontWeight: FontWeight.w400, color: black, size: 14),
                  subTitleText('• Advertisement conversion analytics',
                      fontWeight: FontWeight.w400, color: black, size: 14),
                  subTitleText('• Automation of sales/marketing',
                      fontWeight: FontWeight.w400, color: black, size: 14),
                  SizedBox(height: 15.h),
                  customButton('Learn more',
                      textSize: 14, textColor: white, radius: 10, height: 52)
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Container rowItem(String imgUrl, String text, String subText) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
      height: 140.h,
      width: 240.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: greyLight.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        color: whiteDefault,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 28.h,
            width: 28.w,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: SvgPicture.asset(imgUrl),
          ),
          const Spacer(),
          subTitleText(text,
              color: black, size: 16, fontWeight: FontWeight.w500),
          subTitleText(subText,
              color: black,
              textCenter: false,
              size: 12,
              fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}
