import 'package:get/get.dart';
import 'package:zoxxo/app/modules/bottom_actions/views/bottom_navigation_bar_page.dart';

import '../../../constants/font_constant.dart';
import '../../splash/views/page_view.dart';

class SplashController extends GetxController {
  //TODO: Implement HomeController


  @override
  void onReady() {
    _navigateToHome();
    super.onReady();
  }


  Future _navigateToHome() async{
    await Future.delayed(const Duration(seconds: 1));
    Get.off(()=> const LandingPageView());

  }

}
