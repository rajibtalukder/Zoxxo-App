import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/modules/auth/views/signin_page.dart';
import 'package:zoxxo/app/modules/home/views/home_view.dart';
import 'package:zoxxo/app/modules/pricing/views/pricing_page.dart';

class BottomNavController extends GetxController {

  var currentTab = 0.obs;

  final List<Widget> screens = [
    HomeView(),
    PricingPage(),
    //SigninPage(),
    HomeView(),
    SigninPage(),
  ];

  void changeTab(int index) {
    currentTab.value = index;
  }

  Widget get currentScreen => screens[currentTab.value];
}
