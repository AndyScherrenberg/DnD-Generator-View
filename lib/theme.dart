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

  static const Color mainButtonColorDark = Color(0xFF374045);
  static const Color mainButtonTextDark = Color(0xFFf4f5f5);

  static const Color statBlockRedText = Color(0xFF822000);
  static const Color statBlockRedBackground = Color(0xDD822000);
  static const Color statBlockBlackText = black;
}

TextTheme statBookTextStyle(TextTheme base) {
  return base.copyWith(
    // headline1: base.headline1?.copyWith(
    //   fontFamily: 'Roboto',
    //   fontSize: 22.0,
    //   color: ColorData.red,
    // ),
    // headline6:
    //     base.headline6?.copyWith(fontSize: 15.0, color: Colors.orange),
    // headline4: base.headline1?.copyWith(
    //   fontSize: 24.0,
    //   color: Colors.pink,
    // ),
    // headline3: base.headline1?.copyWith(
    //   fontSize: 22.0,
    //   color: Colors.purple,
    // ),
    // caption: base.caption?.copyWith(
    //   color: ColorData.black,
    // ),
    // bodyText2: base.bodyText2?.copyWith(color: ColorData.black),
    // bodyText1: base.bodyText1?.copyWith(color: ColorData.black, fontSize: 14),

    labelMedium: base.labelMedium
        ?.copyWith(color: ColorData.darkGrey, fontSize: 14),

    headlineSmall: base.headlineSmall
        ?.copyWith(color: ColorData.statBlockRedText, fontSize: 22),
    headlineMedium: base.headlineMedium
        ?.copyWith(color: ColorData.statBlockRedText, fontSize: 22),
    headlineLarge: base.headlineLarge
        ?.copyWith(color: ColorData.statBlockRedText, fontSize: 22),

    bodyMedium: base.bodyMedium
        ?.copyWith(color: ColorData.statBlockRedText, fontSize: 14),
    titleSmall: base.titleSmall?.copyWith(
        color: ColorData.statBlockRedText,
        fontSize: 14.0,
        fontWeight: FontWeight.bold),
    titleMedium: base.titleMedium?.copyWith(
        color: ColorData.statBlockRedText,
        fontSize: 18.0,
        fontWeight: FontWeight.bold),
    titleLarge: base.titleLarge?.copyWith(
        color: ColorData.statBlockRedText,
        fontSize: 22.0,
        fontWeight: FontWeight.bold),
  );
}

ThemeData customLightTheme() {
  const BorderSide defaultBorderSide = BorderSide(
    color: ColorData.black,
    width: 1.0,
  );

  RoundedRectangleBorder defaultRoundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), side: defaultBorderSide);

  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
      // textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
      primaryColor: ColorData.black,
      indicatorColor: ColorData.mediumGrey,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: ColorData.statBlockRedText, fontWeight: FontWeight.bold),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorData.statBlockRedText, //change your color here
        ),
      ),
      // textButtonTheme: const TextButtonThemeData(style: ButtonStyle(
      //   backgroundColor: Colors.yellow,
      //   foregroundColor: Colors.white,
      // )),
      primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
        color: ColorData.black,
        size: 20,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      iconTheme: lightTheme.iconTheme.copyWith(
        color: ColorData.black,
      ),
      tabBarTheme: lightTheme.tabBarTheme.copyWith(
        // labelColor: ColorData.rockstarYellow,
        unselectedLabelColor: Colors.orange,
      ),
      buttonTheme: lightTheme.buttonTheme.copyWith(
          buttonColor: ColorData.mainButtonColorDark,
          focusColor: ColorData.red,
          highlightColor: ColorData.red),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: ColorData.mainButtonTextDark,
            backgroundColor: ColorData.mainButtonColorDark,
            shadowColor: Colors.black,
            minimumSize: const Size(100, 40),
            shape: defaultRoundedRectangleBorder),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        foregroundColor: ColorData.mainButtonTextDark,
        backgroundColor: ColorData.mainButtonColorDark,
        shadowColor: Colors.black,
        minimumSize: const Size(100, 40),
        shape: defaultRoundedRectangleBorder,
      )));
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
