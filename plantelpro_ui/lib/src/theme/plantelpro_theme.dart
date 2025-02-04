import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPROTheme {
  /// Light Theme with updated colors
  ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Roboto',
      textTheme: _lightTextTheme,
      primaryColor: PLANPROColors.primaryYellow,
      canvasColor: _lightBackgroundColor,
      scaffoldBackgroundColor: _lightBackgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      splashColor: PLANPROColors.transparent,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      colorScheme: _lightColorScheme,
      bottomSheetTheme: _lightBottomSheetTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _lightBottomNavigationBarTheme,
      chipTheme: _chipTheme,
      dividerColor: PLANPROColors.lightGrey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme with updated colors
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        textTheme: _darkTextTheme,
        scaffoldBackgroundColor: PLANPROColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: PLANPROColors.white.withOpacity(0.5),
        unselectedWidgetColor: PLANPROColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
      );

  /// Light Color Scheme
  ColorScheme get _lightColorScheme {
    return const ColorScheme.light(
      primary: PLANPROColors.primaryYellow,
      primaryContainer: PLANPROColors.primaryYellow21,
      onPrimary: PLANPROColors.black,
      secondary: PLANPROColors.primaryGreen,
      onSecondary: PLANPROColors.white,
      surface: PLANPROColors.white,
      onSurface: PLANPROColors.black,
      error: PLANPROColors.red,
      onError: PLANPROColors.white,
    );
  }

  /// Dark Color Scheme
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        surface: PLANPROColors.black,
        onSurface: PLANPROColors.lightGrey,
        primary: PLANPROColors.primaryGreen,
        onPrimary: PLANPROColors.white,
      );

  /// Background Color
  Color get _lightBackgroundColor => PLANPROColors.white;

  /// Light AppBar Theme
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      backgroundColor: PLANPROColors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  /// Dark AppBar Theme
  AppBarTheme get _darkAppBarTheme {
    return _lightAppBarTheme.copyWith(
      backgroundColor: PLANPROColors.black,
      iconTheme: _darkIconTheme,
      titleTextStyle: _darkTextTheme.titleMedium,
    );
  }

  /// Light Icon Theme
  IconThemeData get _lightIconTheme => const IconThemeData(
        color: PLANPROColors.black,
      );

  /// Dark Icon Theme
  IconThemeData get _darkIconTheme => const IconThemeData(
        color: PLANPROColors.white,
      );

  /// Divider Theme
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: PLANPROColors.lightGrey,
      thickness: 1,
    );
  }

  /// Light Text Theme
  TextTheme get _lightTextTheme => const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: PLANPROColors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: PLANPROColors.black,
        ),
      );

  /// Dark Text Theme
  TextTheme get _darkTextTheme => _lightTextTheme.apply(
        bodyColor: PLANPROColors.white,
        displayColor: PLANPROColors.white,
      );

  /// Chip Theme
  ChipThemeData get _chipTheme {
    return const ChipThemeData(
      backgroundColor: PLANPROColors.lightGrey,
      labelStyle: TextStyle(color: PLANPROColors.black),
      secondarySelectedColor: PLANPROColors.primaryGreen,
      selectedColor: PLANPROColors.primaryYellow,
    );
  }

  /// Dark Chip Theme
  ChipThemeData get _darkChipTheme => _chipTheme.copyWith(
        backgroundColor: PLANPROColors.black,
        labelStyle: const TextStyle(color: PLANPROColors.white),
      );

  /// Elevated Button Theme
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: PLANPROColors.white,
        backgroundColor: PLANPROColors.primaryGreen,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  /// Text Button Theme
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: PLANPROColors.primaryGreen,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Light Bottom Sheet Theme
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: PLANPROColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    );
  }

  /// Dark Bottom Sheet Theme
  BottomSheetThemeData get _darkBottomSheetTheme =>
      _lightBottomSheetTheme.copyWith(
        backgroundColor: PLANPROColors.black,
      );

  /// Light Bottom Navigation Bar Theme
  BottomNavigationBarThemeData get _lightBottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
      backgroundColor: PLANPROColors.white,
      selectedItemColor: PLANPROColors.primaryGreen,
      unselectedItemColor: PLANPROColors.lightGrey,
    );
  }

  /// Light Outlined Button Theme
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: PLANPROColors.primaryGreen,
        side: const BorderSide(color: PLANPROColors.primaryGreen),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  /// Dark Outlined Button Theme
  OutlinedButtonThemeData get _darkOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: PLANPROColors.white,
        side: const BorderSide(color: PLANPROColors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  /// Switch Theme
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return PLANPROColors.primaryGreen;
        }
        return PLANPROColors.lightGrey;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return PLANPROColors.primaryYellow;
        }
        return PLANPROColors.lightGrey;
      }),
    );
  }

  /// Progress Indicator Theme
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: PLANPROColors.primaryGreen,
      circularTrackColor: PLANPROColors.lightGrey,
    );
  }

  /// Tab Bar Theme
  TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      labelColor: PLANPROColors.primaryGreen,
      unselectedLabelColor: PLANPROColors.lightGrey,
    );
  }
}
