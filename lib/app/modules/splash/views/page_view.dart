import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/modules/splash/views/landing_view1.dart';
import 'package:zoxxo/app/modules/splash/views/landing_view3.dart';
import '../../../constants/colors.dart';
import '../../../constants/font_constant.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/custom_texts.dart';
import '../../../local_storage/shared_pref.dart';
import '../../bottom_actions/views/bottom_navigation_bar_page.dart';
import '../../drawer/views/widgets/custom_small_modal.dart';
import 'landing_view2.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        ++_currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLangCheck? null: Get.dialog(CustomSmallModal());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
                LandingView1(),
                LandingView2(),
                LandingView3(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3, (index) => _buildIndicator(index == _currentPage)),
                ),
                SizedBox(
                  height: 120.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        //Get.offAll(() => const WelcomeView());
                        isSplashAdCheck=true;
                        await SharedPref().saveValue('splashAd',isSplashAdCheck);
                        Get.offAll(() => BottomNavigationBarPage());
                      },
                      child: subTitleText(
                        'Skip',
                        color: isDarkMode? Colors.white: red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    customButton(
                      color: isDarkMode? greyBG:red,
                      textColor: Colors.white,
                      'Next',
                      width: 86.w,
                      height: 36,
                      onPressed: () {
                        if (_currentPage < 2) {
                          _goToNextPage();
                        } else {
                         // Get.offAll(() => const WelcomeView());
                         Get.offAll(() => BottomNavigationBarPage());
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
