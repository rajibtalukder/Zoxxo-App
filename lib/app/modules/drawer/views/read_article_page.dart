import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';
import 'package:zoxxo/app/modules/drawer/views/side_drawer.dart';

import '../../../constants/colors.dart';

class ReadArticlePage extends StatelessWidget {
  ReadArticlePage({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subTitleText(
                  'Innovative File Sharing Platform zoxxo Sets New Standards for '
                  'Speed, Security, and Collaboration. zoxxo, the cutting-edge'
                  ' file-sharing platform, is revolutionizing the way data is '
                  'shared, offering a modern, secure, and lightning-fast '
                  'solution for users ranging from gamers to businesses. '
                  'With a unique approach and a commitment to excellence, '
                  'zoxxo is setting new standards in the world of file sharing.',
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 40.h),
              titleText('Modern, Innovative, and Lightning-Fast',
                  textCenter: false, color: black, size: 16),
              SizedBox(height: 20.h),
              subTitleText(
                  'zoxxo, known for its modern and user-friendly interface, is '
                  'changing the game in the file-sharing industry. It provides'
                  ' users with the ability to upload and share their data '
                  'seamlessly with friends, family, and colleagues, making '
                  'collaboration effortless and efficient.',
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 40.h),
              titleText('A Game-Changer for Gamers and Enterprises',
                  textCenter: false, color: black, size: 16),
              SizedBox(height: 20.h),
              subTitleText(
                  "zoxxo's primary target audience includes gamers and businesses "
                  "looking for secure and efficient data sharing solutions. "
                  "Gamers, in particular, benefit from zoxxo’s lightning-fast "
                  "transfer speeds, which ensure that game files, updates, "
                  "and mods are shared rapidly, enhancing the gaming experience. "
                  "Businesses are also turning to zoxxo to streamline their "
                  "data sharing needs, whether for internal collaboration or "
                  "sharing information with clients and partners. zoxxo offers "
                  "a secure and reliable platform for sharing sensitive data "
                  "without compromising on speed.",
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 40.h),
              titleText('Advertising Opportunities on zoxxo.io',
                  textCenter: false, color: black, size: 16),
              SizedBox(height: 20.h),
              subTitleText(
                  "For businesses looking to reach a diverse and engaged "
                  "audience, zoxxo offers advertising opportunities "
                  "on its platform. With the ability to place advertisements "
                  "on both upload and download pages, businesses can "
                  "effectively target their desired demographic.",
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 40.h),
              titleText('A Single Pricing Plan: Tornado',
                  textCenter: false, color: black, size: 16),
              SizedBox(height: 20.h),
              subTitleText(
                  "Simplicity is key with zoxxo’s pricing model. The "
                  "platform offers a single pricing plan called "
                  "“Tornado,” priced at just \$21.99 per month for "
                  "the base version. This competitive pricing ensures "
                  "accessibility for individuals, gamers, and businesses "
                  "alike, without the confusion of multiple tiers. "
                  "Experience the future of file sharing with zoxxo. "
                  "Visit zoxxo.io to learn more and sign up today.",
                  color: black,
                  fontWeight: FontWeight.w400,
                  textCenter: false,
                  size: 14),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
