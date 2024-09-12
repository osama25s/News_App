import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xff39A552);
  static const Color white = Color(0XFFFFFFFF);
  static const Color black = Color(0XFF000000);
  static const Color grey = Color(0XFFA3A3A3);
  static const Color navy = Color(0XFF42505C);

  static ThemeData lightTeme = ThemeData(
    primaryColor: primary,
    textTheme: TextTheme(
      titleLarge:
          TextStyle(color: navy, fontSize: 26.sp, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.exo(
          color: white, fontSize: 22.sp, fontWeight: FontWeight.w400),
      titleSmall: GoogleFonts.poppins(
          color: black, fontSize: 16.sp, fontWeight: FontWeight.w400),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: white),
      backgroundColor: primary,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20), right: Radius.circular(20)),
      ),
      centerTitle: true,
    ),
  );

  static ThemeData darktheme = ThemeData();
}
