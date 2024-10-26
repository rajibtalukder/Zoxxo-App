import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/constants/font_constant.dart';
import 'app/constants/multifile_asset_loader.dart';
import 'app/local_storage/shared_pref.dart';
import 'app/routes/app_pages.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  isDarkMode = await SharedPref().getValue('theme') ?? false;
  isLangCheck = await SharedPref().getValue('lang') ?? false;
  isSplashAdCheck = await SharedPref().getValue('splashAd') ?? false;
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/lang',
      fallbackLocale: const Locale('en'),
      assetLoader: MultiFileAssetLoader('assets/lang'),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return GetMaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
          }),
    ),
  );
}
