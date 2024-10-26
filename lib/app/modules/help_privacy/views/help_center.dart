import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/custom_widgets/custom_button.dart';
import 'package:zoxxo/app/custom_widgets/custom_texts.dart';
import 'package:zoxxo/app/modules/help_privacy/controllers/help_center_controller.dart';
import '../../auth/views/widgets/build_input_field.dart';
import 'widgets/help_item_row.dart';

class HelpCenter extends StatelessWidget {
  HelpCenter({super.key});

  final HelpCenterController _controller = Get.put(HelpCenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(backgroundColor: white),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<HelpCenterController>(
                  id: 'itemUpdate',
                  builder: (context) {
                    return Column(
                      children: [
                        Container(
                          height: 136.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: black,
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/Help center.jpg"),
                                fit: BoxFit.cover,
                                opacity: 0.4),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              titleText(('We re Here'),
                                  color: white,
                                  fontWeight: FontWeight.w700,
                                  size: 24),
                              titleText('to deliver your data!',
                                  color: white,
                                  fontWeight: FontWeight.w700,
                                  size: 24),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                        titleText('Got a question? No problem.',
                            color: black,
                            size: 18,
                            fontWeight: FontWeight.w600),
                        subTitleText(
                          'We are here to answer any of your question and support '
                          'you where ever you need it. If you don´t find the answer'
                          ' here, then do not hesitate to contact us at support@zoxxo.io',
                          color: black,
                          size: 11,
                        ),
                        SizedBox(height: 40.h),
                        HelpItemRow(
                          question:
                              "Can I share data without having an account?",
                          index: 0,
                          onTap: (index) => _controller.tapContainer(index),
                          selectedIndex: _controller.selectedIndex,
                        ),
                        HelpItemRow(
                          question:
                              "How long is my data available if I upload without an account?",
                          index: 1,
                          onTap: (index) => _controller.tapContainer(index),
                          selectedIndex: _controller.selectedIndex,
                        ),
                        HelpItemRow(
                          question: "How can I upload more than 2 GB?",
                          index: 2,
                          onTap: (index) => _controller.tapContainer(index),
                          selectedIndex: _controller.selectedIndex,
                        ),
                        HelpItemRow(
                          question: "What is included in the FREE Plan?",
                          index: 3,
                          onTap: (index) => _controller.tapContainer(index),
                          selectedIndex: _controller.selectedIndex,
                        ),
                        HelpItemRow(
                          question: "How do I manage my account?",
                          index: 4,
                          onTap: (index) => _controller.tapContainer(index),
                          selectedIndex: _controller.selectedIndex,
                        ),
                        HelpItemRow(
                          question: "Which payment methods are available?",
                          index: 5,
                          onTap: (index) => _controller.tapContainer(index),
                          selectedIndex: _controller.selectedIndex,
                        ),
                      ],
                    );
                  }),
              titleText('You did not found, what you were looking for?',
                  color: black, fontWeight: FontWeight.w600, size: 16),
              SizedBox(height: 30.h),
              subTitleText('Contact us now',
                  color: black, size: 16, fontWeight: FontWeight.w700),
              subTitleText(
                  'Fill out the contact form, Our team will contact you shortly.',
                  color: black,
                  textCenter: false,
                  size: 11,
                  fontWeight: FontWeight.w400),
              SizedBox(height: 30.h),
              buildInputField(
                label: 'Name',
                hint: 'Name or company',
                iconPath: 'assets/images/person.png',
                onChanged: (value) {},
                validator: (e) {
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              buildInputField(
                label: 'Phone number',
                hint: 'Your phone number',
                iconPath: 'assets/images/call.png',
                onChanged: (value) {},
                validator: (e) {
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              buildInputField(
                label: 'Email',
                hint: 'Enter Your Email',
                iconPath: 'assets/images/msgbox.png',
                onChanged: (value) {},
                validator: (e) {
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subTitleText('Message',
                      color: black, fontWeight: FontWeight.w500),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: TextEditingController(),
                    style: TextStyle(
                      color: black,
                    ),
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                            width: 1,
                            color: grey.withOpacity(0.2)), // Not focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                            width: 1,
                            color: grey.withOpacity(0.2)), // Not focused
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                          color: greyLight,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      fillColor: greyBG,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              customButton('Send Message', textColor: white),
              SizedBox(height: 50.h),
              footerRow("assets/images/location.png", 'Fontenay 51, Germany Ludwigschorgast, 95364'),
              SizedBox(height: 16.h),
              footerRow("assets/images/call.png", '+09227 33 58 90  \n+49 102 410 100'),
              SizedBox(height: 20.h),
              footerRow("assets/images/msgbox.png", 'info@zoxxo.com'),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Row footerRow(String imgUrl, String text) {
    return Row(
              children: [
                SizedBox(
                  height: 25.h,
                  width: 25.w,
                  child: Image.asset(imgUrl,color: red),
                ),
                SizedBox(width: 15.w),
                SizedBox(
                  width: 180.w,
                  child: titleText(text,
                      textCenter: false,
                      color: black, fontWeight: FontWeight.w400, size: 12),
                )
              ],
            );
  }
}
