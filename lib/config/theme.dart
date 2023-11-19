import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twasol/core/utils/color_manager.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Cairo",
    scaffoldBackgroundColor: ColorManager.backColor,
    primaryColor: ColorManager.primaryColor,
    secondaryHeaderColor: ColorManager.secondaryColor,
    cardColor: ColorManager.cardColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.secondaryColor,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: ColorManager.backColor
      )
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 18.sp,
        color: ColorManager.cardColor,
          fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorManager.blackColor,
        fontWeight: FontWeight.w500

      ),
      titleSmall: TextStyle(
        color: ColorManager.primaryColor,
        fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        decoration: TextDecoration.underline
      ),
      titleMedium: TextStyle(
          fontSize: 14.sp,
          color: ColorManager.blackColor,
          fontWeight: FontWeight.w400

      )
    )
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: "Cairo",
    scaffoldBackgroundColor: ColorManager.backColor,
    primaryColor: ColorManager.primaryColor,
    secondaryHeaderColor: ColorManager.secondaryColor,
    cardColor: ColorManager.cardColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.secondaryColor,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: ColorManager.backColor
      )
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 18.sp,
        color: ColorManager.cardColor,
          fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorManager.blackColor,
        fontWeight: FontWeight.w500

      ),
      titleSmall: TextStyle(
        color: ColorManager.primaryColor,
        fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        decoration: TextDecoration.underline
      )
    )
  );
}