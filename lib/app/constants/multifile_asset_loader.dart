import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';

class MultiFileAssetLoader extends AssetLoader {
  final String basePath;

  MultiFileAssetLoader(this.basePath);

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    String localePath = '$basePath/${locale.languageCode}';

    List<String> jsonFiles = [
      'auth.json',
      'bottomsheet.json',
      'drawer.json',
      'help.json',
      'home.json',
      'pricing.json',
      'splash.json',
    ];

    Map<String, dynamic> translations = {};

    for (String fileName in jsonFiles) {
      String fullPath = '$localePath/$fileName';
      try {
        String jsonString = await rootBundle.loadString(fullPath);
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        translations.addAll(jsonMap);
      } catch (e) {
        print("Error loading file: $fullPath");
      }
    }

    return translations;
  }
}
