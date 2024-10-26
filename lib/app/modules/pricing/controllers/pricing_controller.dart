import 'package:get/get.dart';

class PricingController extends GetxController{
  RxBool isYear = false.obs;

  RxInt selectedIndex = 0.obs;

  void changeToggle(){
    isYear.value =! isYear.value;
  }
}