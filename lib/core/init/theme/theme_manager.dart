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
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 22,
            height: 1,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 17,
            height: 1.4,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            height: 1.3,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            height: 1.45,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 15,
            height: 1.4,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            height: 1.4,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          overline: TextStyle(
            fontSize: 11,
            height: 1.4,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
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
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: Color.fromARGB(255, 32, 31, 31),
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
