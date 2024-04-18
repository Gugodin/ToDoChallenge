import 'package:flutter/material.dart';

// For backgrounds
const backGroundColor = Color(0xFF070333);
const darkColor = Color(0xFF28216A);

// For elements
const brigthColor = Color(0xFF4D3ECC);

// For fonts
const lighterColor = Color(0xFFCCCAEB);
const lightColor = Color(0xFFA8A5CB);

final themeData = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        background: backGroundColor,
        primary: brigthColor,
        secondary: darkColor),
    scaffoldBackgroundColor: backGroundColor,

    // Segmented button theme
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return brigthColor;
            }
            return Colors.transparent;
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold);
            }
            return const TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400);
          }),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
          iconColor: const MaterialStatePropertyAll(Colors.white)),
    ),
    // Text theme
    textTheme: const TextTheme(
        // LABELS
        labelLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        labelMedium: TextStyle(
            fontSize: 16, color: lighterColor, fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
          color: lightColor,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        )));
