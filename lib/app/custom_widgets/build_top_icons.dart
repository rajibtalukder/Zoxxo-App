import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget  buildTopIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_sharp)),
      GestureDetector(
          onTap: (){

          },
          child: const Icon(Icons.menu)),
    ],
  );
}