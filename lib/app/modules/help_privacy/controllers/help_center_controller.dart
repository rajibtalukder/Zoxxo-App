import 'package:get/get.dart';

class HelpCenterController extends GetxController{
  var selectedIndex = 0.obs;


  void tapContainer(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
    update(['itemUpdate']);
  }
}