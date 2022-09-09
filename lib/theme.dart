import 'package:flutter/material.dart';

class ColorData {
  ColorData._();

  static const Color rockstarYellow = Color(0xFFFFE000);
  static const Color mediumYellow = Color(0xFFFFEA59);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF464646);
  static const Color mediumGrey = Color(0xFF8C8C8C);
  static const Color red = Color(0xFFF44346);
}

ThemeData customLightTheme() {
  const BorderSide defaultBorderSide = BorderSide(
    color: ColorData.black,
    width: 1.0,
  );

  RoundedRectangleBorder defaultRoundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), side: defaultBorderSide);

  TextTheme _customLightThemesTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1?.copyWith(
        fontFamily: 'Roboto',
        fontSize: 22.0,
        color: ColorData.red,
      ),
      headline6: base.headline6?.copyWith(fontSize: 15.0, color: Colors.orange),
      headline4: base.headline1?.copyWith(
        fontSize: 24.0,
        color: Colors.pink,
      ),
      headline3: base.headline1?.copyWith(
        fontSize: 22.0,
        color: Colors.purple,
      ),
      caption: base.caption?.copyWith(
        color: ColorData.black,
      ),
      bodyText2: base.bodyText2?.copyWith(color: ColorData.black),
      bodyText1: base.bodyText1?.copyWith(color: ColorData.black),
      // titleSmall: base.titleSmall?.copyWith(color: black),
      // titleLarge: base.titleLarge?.copyWith(color: black),
      // titleMedium: base.titleMedium?.copyWith(color: black)
    );
  }

  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
      textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
      primaryColor: ColorData.black,
      indicatorColor: ColorData.mediumGrey,
      scaffoldBackgroundColor: ColorData.rockstarYellow,
      appBarTheme: const AppBarTheme(
          color: ColorData.rockstarYellow,
          titleTextStyle: TextStyle(color: ColorData.black)),
      // textButtonTheme: const TextButtonThemeData(style: ButtonStyle(
      //   backgroundColor: Colors.yellow,
      //   foregroundColor: Colors.white,
      // )),
      primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
        color: ColorData.black,
        size: 20,
      ),
      iconTheme: lightTheme.iconTheme.copyWith(
        color: ColorData.black,
      ),
      backgroundColor: ColorData.rockstarYellow,
      tabBarTheme: lightTheme.tabBarTheme.copyWith(
        labelColor: ColorData.rockstarYellow,
        unselectedLabelColor: Colors.orange,
      ),
      buttonTheme: lightTheme.buttonTheme.copyWith(
          buttonColor: ColorData.black,
          focusColor: ColorData.red,
          highlightColor: ColorData.red),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: ColorData.black,
            backgroundColor: ColorData.mediumYellow,
            shadowColor: Colors.black,
            minimumSize: const Size(100, 40),
            shape: defaultRoundedRectangleBorder),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        foregroundColor: ColorData.black,
        backgroundColor: ColorData.mediumYellow,
        shadowColor: Colors.black,
        minimumSize: const Size(100, 40),
        shape: defaultRoundedRectangleBorder,
      )),
      errorColor: Colors.red,
      cardTheme: CardTheme(
          shape: defaultRoundedRectangleBorder, color: ColorData.mediumYellow));
}

ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    primaryColor: Colors.black38,
    indicatorColor: Color(0xFF807A6B),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: Colors.green,
      size: 20,
    ),
  );
}
