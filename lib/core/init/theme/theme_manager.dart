import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/core/init/theme/text_manager.dart';
import 'colors_manager.dart';

class ThemeManager {
  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xFF937DC2),
        primaryColorLight: const Color(0xFFffffff),
        brightness: Brightness.light,
        fontFamily: 'Rubik',
        scaffoldBackgroundColor: Colors.grey[50],
        platform: TargetPlatform.android,
        appBarTheme: const AppBarTheme(
          color: Color(0xFF937DC2),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          iconTheme: IconThemeData(
            size: 30,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          size: 30,
          color: ColorManager.lightGrey,
        ),
        textTheme: TextManager.textStyle,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF937DC2),
          textTheme: ButtonTextTheme.primary,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        primaryColorLight: const Color.fromARGB(255, 255, 255, 255),
        brightness: Brightness.dark,
        platform: TargetPlatform.android,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff323232),
            elevation: 0.0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: IconThemeData(
              size: 30,
              color: Color(0xff323232),
            )),
        iconTheme: const IconThemeData(
          size: 30,
          color: ColorManager.lightGrey,
        ),
        textTheme: TextManager.textStyle,
      );

  static ThemeData get dividerColor => ThemeData(
        dividerColor: ColorManager.lightGrey,
      );

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
