import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color greyColor = Color(0xff4F5A69);
  static Color redColor = Color(0xffC91C22);
  static Color blueDarkColor = Color(0xff003E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color blueLightColor = Color(0xff4882CF);
  static Color yellowLightColor = Color(0xffF2D352);
  static Color blackColor = Color(0xff303030);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: greyColor,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w100,
      ),
      titleLarge: TextStyle(
        color: blackColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
