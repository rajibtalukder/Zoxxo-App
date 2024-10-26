import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomsheetController extends GetxController {
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  @override
  void onClose() {
    scrollController1.dispose();
    super.onClose();
  }

  RxBool isEmailButton = true.obs;
  RxBool isLinkActive = false.obs;

  List<String> fileNames = [];
  List<String> fileSizes = [];
  List<File> files = [];

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      fileNames = result.files.map((file) => file.name).toList();
      fileSizes = result.files
          .map((file) => (file.size / 1000000).toStringAsFixed(2))
          .toList();
    } else {
      // User canceled the picker
      return;
    }
    update(['fileUpdate']);
  }
}
