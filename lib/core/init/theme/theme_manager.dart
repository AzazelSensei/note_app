import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/core/init/theme/text_manager.dart';
import 'colors_manager.dart';

class ThemeManager {
  static ThemeData get theme => ThemeData(
        primaryColor: ColorManager.mainTheme,
        brightness: Brightness.light,
        fontFamily: 'Rubik',
        scaffoldBackgroundColor: ColorManager.lightGrey,
        platform: TargetPlatform.android,
        appBarTheme: const AppBarTheme(
          color: ColorManager.mainTheme,
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
            color: Colors.black,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: ColorManager.black,
          ),
        ),
        iconTheme: const IconThemeData(
          size: 30,
          color: ColorManager.lightGrey,
        ),
        textTheme: _textTheme(),
        buttonTheme: const ButtonThemeData(
          buttonColor: ColorManager.mainTheme,
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          iconColor: ColorManager.black,
          fillColor: ColorManager.mainTheme,
          hintStyle: TextStyle(color: Colors.black87),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: ColorManager.mainTheme,
          inactiveTrackColor: ColorManager.black,
          trackHeight: 4.0,
          thumbColor: ColorManager.mainTheme,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayColor: ColorManager.mainTheme,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
        ),
      );

  static TextTheme _textTheme() => const TextTheme(
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
            backgroundColor: ColorManager.darktheme,
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
        inputDecorationTheme: const InputDecorationTheme(
          iconColor: ColorManager.white,
          fillColor: ColorManager.mainTheme,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: ColorManager.white,
          ),
        ),
      );

  static ThemeData get dividerColor => ThemeData(
        dividerColor: ColorManager.lightGrey,
      );

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
