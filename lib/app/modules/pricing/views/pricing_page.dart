import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../custom_widgets/custom_texts.dart';
import '../../help_privacy/controllers/help_center_controller.dart';
import '../../help_privacy/views/widgets/help_item_row.dart';
import '../controllers/pricing_controller.dart';
import 'widgets/month_year_change_widget.dart';
import 'widgets/pricing_bottom_sheet_widget.dart';
import 'widgets/show_pricing_widget.dart';
import 'widgets/tab_buttons_widget.dart';

class PricingPage extends StatelessWidget {
  PricingPage({super.key});
 final PricingController _controller = Get.put(PricingController());
 final HelpCenterController helpController = Get.put(HelpCenterController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subTitleText('Simple pricing for individuals and teams',
                color: black, fontWeight: FontWeight.w400, size: 14),
            SizedBox(height: 16.h),
            monthYearChangeWidget(_controller),
            SizedBox(height: 30.h),
            tabButtonsWidget(_controller),
            SizedBox(height: 16.h),
            showPricingWidget(_controller),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: (){
                Get.bottomSheet(
                  pricingBottomSheetWidget(), // Call the custom BottomSheet
                  backgroundColor: white,
                  isScrollControlled: true,
                );
              },
              child: Row(
                children: [
                  subTitleText('Subscription details', color: black, size: 14, fontWeight: FontWeight.w400),
                  SizedBox(width: 5.w),
                  Icon(Icons.arrow_upward,color: black,size: 18,)
                ],
              ),
            ),
            SizedBox(height: 30.h),
            titleText('Want to save more money?',
                color: black, size: 18, fontWeight: FontWeight.w600),
            subTitleText(
              'Without Plan Pricing, you will get access to all of the Features and Tools immediately.',
                textCenter: false,
              color: black,
              fontWeight: FontWeight.w400,
              size: 12,
            ),
            SizedBox(
              height: 200.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    rowItem(
                        Image.asset("assets/images/splash_logo.png",color: red),
                        'Zoxxo',
                        'Upload your data',
                        'zoxxo is a modern platform to upload your data '
                            'anonymus, secure and fast.'),
                    rowItem(
                        SvgPicture.asset("assets/images/dropbox.svg"),
                        'Dropbox',
                        'Share with others!',
                        'Share your uploaded data and ideas with your'
                            ' friends, family and others!'),
                    rowItem(
                        SvgPicture.asset("assets/images/drive.svg"),
                        'Google drive',
                        'Share with others!',
                        'Share your uploaded data and ideas with your'
                            ' friends, family and others!'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            helpContainer(),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }

  Container rowItem(Widget imgWidget,String name, String text, String subText) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      height: 180.h,
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
          Row(
            children: [
              SizedBox(
                height: 28.h,
                width: 28.w,
                 child:  imgWidget
              ),
              SizedBox(width: 10.w),
              subTitleText(name, color: black,size: 16,fontWeight: FontWeight.w700)
            ],
          ),
          SizedBox(height: 18.h),
          subTitleText('10.99 USD',
              color: black, size: 16, fontWeight: FontWeight.w600),
          subTitleText('Per TB per month',
              color: black, size: 12, fontWeight: FontWeight.w400),
          SizedBox(height: 22.h),
          Row(children: [
            Icon(Icons.done,color: black, size: 14,),
            SizedBox(width: 5.w),
            subTitleText('End to end encryption',
                color: black, size: 14, fontWeight: FontWeight.w500),
          ],)
        ],
      ),
    );
  }

 Widget helpContainer() {
    return GetBuilder<HelpCenterController>(
        id: 'itemUpdate',
        builder: (context) {
          return Column(
            children: [
              SizedBox(height: 20.h),
              titleText('Got a question? No problem.',
                  color: black, size: 18, fontWeight: FontWeight.w600),
              subTitleText(
                'We are here to answer any of your question and support '
                    'you where ever you need it. If you don´t find the answer'
                    ' here, then do not hesitate to contact us at support@zoxxo.io',
                color: black,
                size: 11,
              ),
              SizedBox(height: 40.h),
              HelpItemRow(
                question: "Can I share data without having an account?",
                index: 0,
                onTap: (index) => context.tapContainer(index),
                selectedIndex: context.selectedIndex,
              ),
              HelpItemRow(
                question: "How long is my data available if I upload without an account?",
                index: 1,
                onTap: (index) => context.tapContainer(index),
                selectedIndex: context.selectedIndex,
              ),
              HelpItemRow(
                question: "How can I upload more than 2 GB?",
                index: 2,
                onTap: (index) => context.tapContainer(index),
                selectedIndex: context.selectedIndex,
              ),
              HelpItemRow(
                question: "What is included in the FREE Plan?",
                index: 3,
                onTap: (index) => context.tapContainer(index),
                selectedIndex: context.selectedIndex,
              ),
              HelpItemRow(
                question: "How do I manage my account?",
                index: 4,
                onTap: (index) => context.tapContainer(index),
                selectedIndex: context.selectedIndex,
              ),
              HelpItemRow(
                question: "Which payment methods are available?",
                index: 5,
                onTap: (index) => context.tapContainer(index),
                selectedIndex: context.selectedIndex,
              ),
            ],
          );
        });
  }
}
