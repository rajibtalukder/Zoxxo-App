import 'package:flutter/material.dart';


// light mode colors-------

 Color greyLight = const Color(0xff928FA6);
 Color greyBG = const Color(0xffF9F9F9);
 Color btnGrey = const Color(0xffE4E7EB);
 Color txtGrey = const Color(0xff4B5768);
 Color green = const Color(0xff00A600);
 Color whiteDeep = const Color(0xffD9D9D9);
 Color black = const Color(0xff000000);
 Color white = const Color(0xffFAFAFA);
 Color whiteDefault = const Color(0xffFFFFFF);
 Color grey = const Color(0xff858181);
const Color red = Color(0xffFF0000);
const Color buttonDark = Color(0xff183042);


// dark mode colors-------
const Color greyLightDark = Color(0xff6D7059);
const Color greyBGDark = Color(0xff0E1B25);
const Color btnGreyDark = Color(0xff1B1814);
const Color txtGreyDark = Color(0xffB4A897);
const Color greenDark = Color(0xffFF5DFF);
const Color whiteDeepDark = Color(0xff262626);
const Color blackDark = Color(0xffFFFFFF);
const Color whiteDark = Color(0xff000000);
const Color greyDark = Color(0xff6e6e6e);

 // Darker deep white

Future <void> applyThem(bool dark) async {
  if (dark) {
    //greyLight= greyLightDark;
    greyBG = greyBGDark;
    btnGrey = btnGreyDark;
    txtGrey = txtGreyDark;
    whiteDeep = whiteDeepDark;
    black = blackDark;
    white = whiteDark;
    whiteDefault = whiteDark;
    grey =greyDark;

  } else {
     greyLight = const Color(0xff928FA6);
     greyBG = const Color(0xffF9F9F9);
     btnGrey = const Color(0xffE4E7EB);
     txtGrey = const Color(0xff4B5768);
     green = const Color(0xff00A600);
     whiteDeep = const Color(0xffD9D9D9);
     black = const Color(0xff000000);
     white = const Color(0xffFFFFFF);
     whiteDefault = const Color(0xffFFFFFF);
     grey = const Color(0xff858181);
  }
}
