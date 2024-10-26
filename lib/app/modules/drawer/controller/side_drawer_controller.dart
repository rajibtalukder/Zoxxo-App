import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/font_constant.dart';
import '../../../local_storage/shared_pref.dart';
import '../../bottom_actions/views/bottom_navigation_bar_page.dart';

class SideDrawerController extends GetxController{

  RxBool isExpanded = true.obs;

  void expandWidget(){
    isExpanded.value = !isExpanded.value;
    update(['updateExpand']);
  }

  Future<void> changeTheme() async {
    isDarkMode = !isDarkMode;
    await applyThem(isDarkMode).then((e) {
      Get.offAll(BottomNavigationBarPage());
    });
    await SharedPref()
        .saveValue('theme', isDarkMode);
  }



}