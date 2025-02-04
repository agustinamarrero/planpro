import 'package:plantelpro_ui/plantelpro_ui.dart';
import 'package:flutter/material.dart';

///Extension on Themedata that must be added to return the correct asset
extension ThemeX on ThemeData {
  ///Returns the correct PLANPROIcon based on the current theme
  PLANPROIcon get icons {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return PLANPROIconsDark();
    } else {
      return  PLANPROIconsLight();
    }
  }
}
