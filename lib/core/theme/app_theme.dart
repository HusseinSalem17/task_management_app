import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager_app/core/constants/color_constants.dart';

class AppTheme {
  // headingStyle -> headlineLarge
  // subHeadingStyle -> headlineMedium
  // titleStyle -> headlineSmall
  // subTitleStyle -> titleMedium
  // bodyStyle -> bodyLarge
  // body2Style -> bodyMedium
  static ThemeData lightTheme = FlexThemeData.light(
    useMaterial3: true,
    scheme: FlexScheme.green,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    subThemesData: const FlexSubThemesData(
      bottomAppBarSchemeColor: SchemeColor.primary,
    ),
    textTheme: TextTheme(
      // bodySmall: GoogleFonts.lato(
      //   textStyle: TextStyle(fontSize: 14.sp),
      // ),
      // titleSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
      titleMedium: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      // titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal),
      // labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
      // labelMedium: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
      // labelLarge: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: ColorConstants.lightPrimaryText,
        ),
      ),
      headlineMedium: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorConstants.lightPrimaryText,
        ),
      ),
      headlineSmall: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: ColorConstants.lightPrimaryText,
        ),
      ),
      bodyLarge: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstants.lightPrimaryText,
        ),
      ),
      bodyMedium: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstants.lightPrimaryText,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = FlexThemeData.dark(
    useMaterial3: true,
    scheme: FlexScheme.bigStone,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    swapColors: true,
    subThemesData: const FlexSubThemesData(
      bottomAppBarSchemeColor: SchemeColor.primary,
    ),
    textTheme: TextTheme(
      // bodySmall: GoogleFonts.lato(
      //   textStyle: TextStyle(fontSize: 14.sp),
      // ),
      // titleSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
      titleMedium: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      // titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal),
      // labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
      // labelMedium: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
      // labelLarge: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: ColorConstants.darkPrimaryText,
        ),
      ),
      headlineMedium: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorConstants.darkPrimaryText,
        ),
      ),
      headlineSmall: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: ColorConstants.darkPrimaryText,
        ),
      ),
      bodyLarge: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstants.darkPrimaryText,
        ),
      ),
      bodyMedium: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstants.darkPrimaryText,
        ),
      ),
    ),
  );

  //   static TextStyle subHeadingStyle(BuildContext context) {
  //   return GoogleFonts.lato(
  //     textStyle: TextStyle(
  //       color: Theme.of(context).brightness == Brightness.dark
  //           ? Colors.white
  //           : Colors.black,
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  // }
}
