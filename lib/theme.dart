import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrimonialsullokupdated/Global/constant.dart';

class Themes {
  ThemeData lightTheme() {
    return ThemeData(
        primaryColor: AppColor.purple,
        fontFamily: "Poppins",
        cardTheme: lightCardTheme(),
        iconTheme: iconTheme(),
        buttonTheme: lightButtonThemeData(),
        textTheme: lightTextTheme());
  }

  ThemeData darkTheme() {
    return ThemeData(
        primaryColor: AppColor.purple,
        fontFamily: "Poppins",
        cardTheme: darkCardTheme(),
        iconTheme: iconTheme(),
        buttonTheme: darkButtonThemeData(),
        textTheme: darkTextTheme());
  }

  TextTheme lightTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
      // Body text style for medium text
      bodyMedium: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      // Body text style for small text
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
    );
  }

  TextTheme darkTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
      // Body text style for medium text
      bodyMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      // Body text style for small text
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
    );
  }

  CardTheme lightCardTheme() {
    return const CardTheme(
        color: AppColor.whiteColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ));
  }

  CardTheme darkCardTheme() {
    return const CardTheme(
        color: AppColor.black,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ));
  }

  IconThemeData iconTheme() {
    return const IconThemeData(
      color: AppColor.purple, // Default icon color
      size: 24, // Default icon size
    );
  }

  ButtonThemeData lightButtonThemeData() {
    return ButtonThemeData(
      buttonColor: AppColor.purple, // Default button color
      height: 80.h,
      padding: EdgeInsets.all(10.0),
      textTheme: ButtonTextTheme.primary, // Text style for buttons
    );
  }

  ButtonThemeData darkButtonThemeData() {
    return ButtonThemeData(
      buttonColor: AppColor.purple, // Default button color
      height: 80.h,
      padding: EdgeInsets.all(10.0),
      textTheme: ButtonTextTheme.primary, // Text style for buttons
    );
  }
}
