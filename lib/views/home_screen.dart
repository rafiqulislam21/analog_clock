import 'dart:math';

import 'package:analog_clock/controllers/time_controller.dart';
import 'package:analog_clock/utils/language_services.dart';
import 'package:analog_clock/utils/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'clock_painter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
                leading: Icon(ThemeService().loadThemeFromBox()
                    ? Icons.wb_twighlight
                    : Icons.wb_sunny_sharp),
                title: Text('change_theme'.tr),
                subtitle: Text(
                    ThemeService().loadThemeFromBox() ? 'dark'.tr : 'light'.tr),
                trailing: Switch(
                  value: ThemeService().loadThemeFromBox(),
                  onChanged: (val) {
                    ThemeService().switchTheme();
                  },
                  activeColor: Theme.of(context).accentColor,
                )),
            ListTile(
                leading: Icon(Icons.translate),
                title: Text('change_language'.tr),
                subtitle: Text(LanguageService().locale.languageCode == 'bn'
                    ? 'bengali'.tr
                    : 'english'.tr),
                trailing: Switch(
                  value: LanguageService().locale.languageCode == 'bn'
                      ? true
                      : false,
                  onChanged: (val) {
                    if (val) {
                      LanguageService()
                          .switchLanguage(changeLocale: Locale('bn', 'BD'));
                    } else {
                      LanguageService()
                          .switchLanguage(changeLocale: Locale('en', 'US'));
                    }
                  },
                  activeColor: Theme.of(context).accentColor,
                )),
          ],
        ),
      ),*/
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey, Colors.white],
                stops: [0.0, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp)),
        child: GetX<TimeController>(
            init: TimeController(),
            builder: (snapshot) {
              var timeNow = snapshot.now.value.hour;
              String greeting = "";
              IconData greetingIcon = Icons.wb_sunny_sharp;
              if (timeNow <= 12) {
                greeting = 'Good Morning';
                greetingIcon = Icons.wb_twighlight;
              } else if ((timeNow > 12) && (timeNow <= 16)) {
                greeting = 'Good Afternoon';
                greetingIcon = Icons.wb_sunny_sharp;
              } else if ((timeNow > 16) && (timeNow < 20)) {
                greeting = 'Good Evening';
                greetingIcon = Icons.wb_twighlight;
              } else {
                greeting = 'Good Night';
                greetingIcon = Icons.adjust;
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${snapshot.now.value.hour < 10 ? "0${snapshot.now.value.hour}" : snapshot.now.value.hour}:",
                            style:
                                TextStyle(
                                    fontSize: 80,
                                    color: Colors.black,
                                    fontFamily: GoogleFonts.adventPro().fontFamily
                                ),
                          ),
                          Text(
                            "${snapshot.now.value.minute < 10 ? "0${snapshot.now.value.minute}" : snapshot.now.value.minute}:",
                            style:
                                TextStyle(
                                    fontSize: 80,
                                    color: Colors.amber,
                                    fontFamily: GoogleFonts.adventPro().fontFamily
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${snapshot.now.value.second < 10 ? "0${snapshot.now.value.second}" : snapshot.now.value.second}",
                              style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.red,
                                  fontFamily: GoogleFonts.adventPro().fontFamily
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${DateFormat.yMMMMd().format((snapshot.now.value))}",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54, fontFamily: GoogleFonts.dancingScript().fontFamily),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(greetingIcon,color: Colors.black54),
                          Text(
                            "$greeting",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54,fontFamily: GoogleFonts.dancingScript().fontFamily),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.red.withOpacity(0.14),
                              blurRadius: 64,
                            ),
                          ],
                        ),
                        height: Get.size.width * 0.8,
                        width: Get.size.width * 0.8,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            /*Transform.rotate(
                              angle:
                                  - pi/2*/ /*(snapshot.now.value.second.toDouble() / 6)*/ /*,
                              child: Container(
                                alignment: Alignment.topCenter,
                                color: Colors.blueGrey,
                                height: 100,
                                width: 5,
                              ),
                            ),*/
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        color: Colors.red.withOpacity(0.14),
                                        blurRadius: 64,
                                      ),
                                    ],
                                  ),
                                  child: Transform.rotate(
                                    angle: -pi / 2,
                                    child: CustomPaint(
                                      painter: ClockPainter(
                                          context, snapshot.now.value),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black54,
                                ),
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black54,
                                ),
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black54,
                                ),
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black54,
                                ),
                                height: 20,
                                width: 20,
                              ),
                            ),
                            /*Transform.translate(
                              offset: Offset(100, 200),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.red,
                                ),
                                height: 20,
                                width: 20,
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
