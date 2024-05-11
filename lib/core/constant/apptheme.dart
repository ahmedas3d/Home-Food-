import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColor.white,
  cardColor: AppColor.white,
  listTileTheme: const ListTileThemeData(
    iconColor: AppColor.primaryColor,
    tileColor:Colors.transparent,
    textColor: Colors.black

  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)))),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColor.white,
    foregroundColor: AppColor.primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontSize: 25,
        color: AppColor.primaryColor,
        fontFamily: "Cairo",
        fontWeight: FontWeight.bold),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
        fontFamily: "Cairo"),
    displayMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
        fontFamily: "Cairo"),
    bodyLarge: TextStyle(
        height: 2, color: AppColor.black, fontSize: 14, fontFamily: "Cairo"),
    bodyMedium: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
        fontFamily: "Cairo",
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  useMaterial3: true,
  cardColor: AppColor.white,
  scaffoldBackgroundColor: AppColor.white,
  listTileTheme: const ListTileThemeData(
      iconColor: AppColor.primaryColor,
      tileColor:Colors.transparent,
      textColor: Colors.black

  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.white,
      foregroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)))),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColor.white,
    foregroundColor: AppColor.primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontSize: 25, color: AppColor.primaryColor, fontFamily: "Cairo"),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark),
  ),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
        fontFamily: "Cairo"),
    displayMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
        fontFamily: "Cairo"),
    bodyLarge: TextStyle(
        height: 2, color: AppColor.black, fontSize: 14, fontFamily: "Cairo"),
    bodyMedium: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
        fontSize: 14,
        fontFamily: "Cairo"),
  ),
  primarySwatch: Colors.blue,
);
