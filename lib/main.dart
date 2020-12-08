import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'utils/language_services.dart';
import 'utils/languages.dart';
import 'utils/theme_services.dart';
import 'utils/themes.dart';
import 'views/home_screen.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarIconBrightness: loadThemeFromBox() ? Brightness.light : Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Analog clock',
      translations: Languages(), // your translations
      locale: LanguageService().locale ?? Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'US'),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      enableLog: false,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}