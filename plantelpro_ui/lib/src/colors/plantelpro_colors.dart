import 'package:flutter/material.dart';

abstract class PLANPROColors {
  /// Primary Yellow
  static const Color primaryYellow = Color(0xFFDCC02A);

  /// Primary Green
  static const Color primaryGreen = Color(0xFF006437);

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// Black
  static const Color black = Color(0xFF000000);

  /// Red
  static const Color red = Color(0xFFFF0000);

  /// Red 100
  static const Color red100 = Color(0xFFd16d6a);

  /// Secondary Red
  static const Color secondaryRed = Color.fromARGB(41, 224, 32, 32);

  /// Grey (Light Grey)
  static const Color lightGrey = Color(0xFFD9D9D9);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// Primary Yellow (21% Opacity)
  static const Color primaryYellow21 = Color(0x35DCC02A); // 21% opacity

  /// Secondary Yellow
  static const Color secondaryYellow = Color(0xFF3F3A20);

  /// Primary Green (21% Opacity)
  static const Color primaryGreen21 = Color(0x35006437); // 21% opacity

  /// Modal Background (Slightly darker white for modals)
  static const Color modalBackground = Color(0xFFF2F2F2);

  /// Border Outline
  static const Color borderOutline =
      Color(0x33000000); // Slightly transparent black

  /// Bright Grey
  static const Color brightGrey = Color(0xFFEAEAEA);

  /// Secondary Swatch (Custom MaterialColor)
  static const MaterialColor secondary = MaterialColor(0xFFDCC02A, <int, Color>{
    50: Color(0xFFFFF8E5),
    100: Color(0xFFFFEDBF),
    200: Color(0xFFFEE096),
    300: Color(0xFFFED36D),
    400: Color(0xFFFCC642),
    500: Color(0xFFDCC02A),
    600: Color(0xFFB5A024),
    700: Color(0xFF8E801E),
    800: Color(0xFF666017),
    900: Color(0xFF3E400E),
  });

  /// Secondary Green Swatch (Custom MaterialColor)
  static const MaterialColor greenSwatch =
      MaterialColor(0xFF006437, <int, Color>{
    50: Color(0xFFE0F2E8),
    100: Color(0xFFB3E0C7),
    200: Color(0xFF80CDA3),
    300: Color(0xFF4DBA7F),
    400: Color(0xFF26A65D),
    500: Color(0xFF006437),
    600: Color(0xFF00572E),
    700: Color(0xFF004A26),
    800: Color(0xFF003D1D),
    900: Color(0xFF002F14),
  });
}
