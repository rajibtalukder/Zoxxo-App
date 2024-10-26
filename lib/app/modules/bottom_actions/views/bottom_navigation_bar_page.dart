import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoxxo/app/constants/colors.dart';
import 'package:zoxxo/app/modules/drawer/views/side_drawer.dart';

import '../../../constants/font_constant.dart';
import '../controller/bottom_nav_controller.dart';
import 'custom_bottom_sheet.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  final BottomNavController navController = Get.put(BottomNavController());

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
            Container(
              padding: EdgeInsets.only(left: 10.w),
                height: 40.h,
                width: 46.w,
                child:
                Image.asset("assets/images/splash_logo.png", color: red)),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(Icons.menu,color: black)),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: Obx(() => PageStorage(
            bucket: PageStorageBucket(),
            child: navController.currentScreen,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            CustomBottomSheet(), // Call the custom BottomSheet
            backgroundColor: white,
            isScrollControlled: true,
          );
        },
        backgroundColor: red,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shadowColor: grey,
        elevation: 15,
        color: isDarkMode?greyBG: white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNavItem("assets/images/home_icon.png", 0),
                  buildNavItem("assets/images/pricing_icon.png", 1),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNavItem("assets/images/status_icon.png", 2),
                  buildNavItem("assets/images/profile_icon.png", 3),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(String iconUrl, int index) {
    return Obx(() => TextButton(
          onPressed: () {
            navController.changeTab(index);
          },
          child: SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(iconUrl,
                color: navController.currentTab.value == index ? red : grey),
          ),
        ));
  }
}
