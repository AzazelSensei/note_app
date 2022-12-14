// ignore_for_file: depend_on_referenced_packages

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/init/theme/colors_manager.dart';

class ModeSwitcher extends StatefulWidget {
  const ModeSwitcher({Key? key}) : super(key: key);

  @override
  State<ModeSwitcher> createState() => _ModeSwitcherState();
}

class _ModeSwitcherState extends State<ModeSwitcher> {
  bool isDark = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      checkTheme();
      setState(() {});
    });
    super.initState();
  }

  void checkTheme() {
    int themeId = DynamicTheme.of(context)!.themeId;
    if (themeId == 1) {
      isDark = false;
    } else {
      isDark = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: DayNightSwitcherIcon(
        dayBackgroundColor: ColorManager.mainTheme,
        isDarkModeEnabled: isDark,
        onStateChanged: (isDarkModeEnabled) async {
          isDark = isDarkModeEnabled;

          if (isDarkModeEnabled) {
            DynamicTheme.of(context)!.setTheme(0);
          } else {
            DynamicTheme.of(context)!.setTheme(1);
          }

          setState(() {});
        },
      ),
    );
  }
}
