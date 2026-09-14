import 'package:flutter/material.dart';

class AppColors {
  // SEMO Network palette (see semo-network-main tailwind.config.js). Identifiers kept from upstream.
  static const _primaryValue = 0xFF0A1C2A; // semo ink

  static const Color primary = MaterialColor(_primaryValue, {
    50: Color(0xff8392a1),
    100: Color(0xff58697a),
    200: Color(0xff3a4b5c),
    300: Color(0xff243747),
    400: darkGreen3,
    500: Color(_primaryValue),
    600: Color(0xff091927),
    700: Color(0xff081622),
    800: Color(0xff07131d),
    900: Color(0xff061018)
  });

  /// Basic Colors
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  /// Primary Colors
  static const green1 = Color(0xFF2E9CC7); // semo tide
  static const green2 = Color(0xFF1F5E83); // semo deep
  static const green3 = Color(0xFF7FCDEB); // semo sky

  /// Use Primary Color
  //static const darkGreen1 = Color(0xFF0A1C2A);
  static const darkGreen2 = Color(0xFF133246); // semo river
  static const darkGreen3 = Color(0xFF1A3A50);
  static const darkGreen4 = Color(0xFF07131D);
  static const canopy = Color(0xFF2E9CC7);

  /// Lighter Shades
  static const grey1 = Color(0xFF8392A1);
  static const grey2 = Color(0xFF8A97A5);
  static const grey3 = Color(0xFFB3BEC9);

  static const lightGreen1 = Color(0xFF1A3A50);
  static const lightGreen2 = Color(0xFF1F4560);
  static const lightGreen3 = Color(0xFF1F5E83);
  static const lightGreen4 = Color(0xFF164366);
  static const lightGreen5 = Color(0xFFCDE9F4); // semo mist
  static const lightGreen6 = Color(0xFF7FCDEB);

  static const whiteYellow = Color(0xFFFBF9F2); // semo paper

  /// Gradients
  static final gradientNeonGreen = RadialGradient(
    colors: [
      canopy.withOpacity(0.50),
      canopy.withOpacity(1),
    ],
  );

  static const gradientDarkGreen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2E9CC7),
      Color(0xFF1F5E83),
    ],
  );

  static const gradientLightGreen = RadialGradient(
    colors: [
      Color(0xFFE6F5FB),
      Color(0xFFCDE9F4),
    ],
  );

  static const gradientBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00C7E0),
      Color(0xFF007694),
    ],
  );

  /// Status Colors
  static const red1 = Color(0xFFFF2919);
  static const red2 = Color(0xFFBD4545);
  static final deepRed = const Color(0xFFFF2919).withOpacity(0.15);

  static const orangeYellow = Color(0xFFE59900);
  static const tagGreen1 = Color(0xFF16334A);
  static const tagGreen2 = Color(0xFF12304A);
  static const tagGreen3 = Color(0xFF12304A);
  static const tagBlue = Color(0xFF239BB2);
  static final muddyYellow = const Color(0xFFE59900).withOpacity(0.15);
  static const subtitle = Color(0xFFCC52CC);

  // DEPRECATED COLORS. DO NOT USE THESE COLORS ANYMORE
  static const purple = Color(0xFF5719FF);

  static const lightBlue = Color.fromRGBO(61, 179, 158, 1);
  static const lightGrey19 = Color.fromRGBO(61, 179, 158, 1);
  static const lightGrey = Color.fromRGBO(242, 242, 242, 1);
  static const black50 = Color.fromRGBO(0, 0, 0, 0.5);

  static const lightGreen = Colors.lightGreen;

  static const green = Color(0xFF2E9CC7);
  static const grey = Color(0xFF6C6C6C);

  static const blue = Color(0xFF3A8BA8);
  static const orange = Color(0xFFFF9900);
  static const red = Color(0xFFEB5757);
  static const borderGrey = Color(0xFFEBEBEB);
  static const gradient = [blue, blue];

  static Color getColorByString(String? str) {
    var hash = 0;
    if (str == null || str.isEmpty) {
      return Colors.grey;
    }
    for (var i = 0; i < str.length; i++) {
      hash = str.codeUnitAt(i) + ((hash << 5) - hash);
      hash = hash & hash; // Convert to 32bit integer
    }
    final shortened = hash.abs() % 360;
    return HSLColor.fromAHSL(1.0, shortened.toDouble(), 0.3, 0.6).toColor();
  }
}
