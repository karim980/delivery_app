import 'package:flutter/material.dart';

import 'colors/app_color.dart';

final appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      toolbarHeight: 75,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black, size: 30),
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.w300,color: Colors.grey),
      headline2: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(4),
            backgroundColor: MaterialStatePropertyAll(AppColors.mainColor))),
    brightness: Brightness.light,
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColors.mainColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColor,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
      floatingLabelStyle: TextStyle(color: Colors.black),
      iconColor: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.mainColor,
        selectedIconTheme: IconThemeData(color: AppColors.mainColor)));
