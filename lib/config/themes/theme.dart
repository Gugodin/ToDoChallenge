import 'package:flutter/material.dart';

import '../colors/colors.dart';

/* Tema de la aplicacion */

final themeData = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: ColorsApp.backGroundColor,
        primary: ColorsApp.brigthColor,
        secondary: ColorsApp.darkColor),
    scaffoldBackgroundColor: ColorsApp.backGroundColor,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorsApp.backGroundColor,
        modalBarrierColor: Colors.black.withOpacity(0.2)),
    // Date picker theme
    datePickerTheme: const DatePickerThemeData(
      headerHelpStyle: TextStyle(fontSize: 25),
        cancelButtonStyle: ButtonStyle(
            textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20))),
        confirmButtonStyle: ButtonStyle(
            textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20))),
            ),

    //Text Form Field theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      fillColor: ColorsApp.brigthColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
    ),

    //Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40)),
      backgroundColor: MaterialStatePropertyAll(ColorsApp.brigthColor),
    )),

    // Segmented button theme
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return ColorsApp.brigthColor;
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
    // Circular progres indicator theme
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(circularTrackColor: Colors.white),

    // Text theme
    textTheme: TextTheme(
        // LABELS
        labelLarge: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        labelMedium: const TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
        labelSmall: TextStyle(
          color: ColorsApp.lightColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        )));
