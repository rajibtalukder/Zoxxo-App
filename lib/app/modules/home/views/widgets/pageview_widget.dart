import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/font_constant.dart';
import '../../../../custom_widgets/custom_texts.dart';

class PageviewWidget extends StatefulWidget {
  const PageviewWidget({super.key});

  @override
  _PageviewWidgetState createState() => _PageviewWidgetState();
}

class _PageviewWidgetState extends State<PageviewWidget> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              _buildColumn(
                  LottieBuilder.asset(
                    "assets/lottie/file-transfer-animation.json",
                    //fit: BoxFit.cover,
                  ),
                  "We don't transfer, we deliver!",
                  'zoxxo do not focus on "just doing the work", we deliver instead. '
                      'We deliver your data to your data destination fast, secure and easy. '
                      'for managing your data, you can use our next generation file manager '
                      'with workspace.',
                  'Register now for free'),
              _buildColumn(
                  LottieBuilder.asset(
                    "assets/lottie/l2.json",
                    //fit: BoxFit.cover,
                  ),
                  'Big ideas, big data. Not a big deal for us',
                  'If you upload huge files and want to have more space, then you should use '
                      'our TORNADO plan.You can upgrade and downgrade your storage every '
                      'month. Only pay what you use.',
                  'Pay what you use'),
              _buildColumn(
                  LottieBuilder.asset(
                    "assets/lottie/l3.json",
                    //fit: BoxFit.cover,
                  ),
                  'Brands on top to make impression!',
                  'Make noise about your brand. Advertising alongside data from around '
                      'the world.The more you impress your audience, the more will '
                      'celebrate you!',
                  'Advertise with us'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3, (index) => _buildIndicator(index == _currentPage)),
          ),
        ),
        SizedBox(height: 50.h),
      ],
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 7.h,
      width: isActive ? 16.w : 7.h,
      decoration: BoxDecoration(
        color: isActive ? red : Colors.grey,
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }

  Widget _buildColumn(
      Widget lottieWidget, String title, String subtitle, String btnTxt) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 140.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: greyLight.withOpacity(0.3))),
              child: lottieWidget),
          SizedBox(height: 10.h),
          SizedBox(
            height: 80.h,
            child: titleText(title,
                size: 26,
                fontWeight: FontWeight.w500,
                color: black,
                textCenter: false),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 130.h,
            child: subTitleText(subtitle,
                color: black,
                size: 14,
                fontWeight: FontWeight.w400,
                textCenter: false),
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 52.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode ? buttonDark : red,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: subTitleText(btnTxt,
                      size: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )),
          ),
        ],
      ),
    );
  }
}
