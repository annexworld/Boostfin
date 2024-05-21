import 'package:boostfin/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  /// Returns the current theme data.
  ThemeData _getThemeData() {
    return ThemeData(
      fontFamily: 'Grotesk',
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
      // Text Theme
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.neutral100,
          fontFamily: 'Grotesk',
        ),
      ),
      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(328.w, 56.h),
          foregroundColor: PrimaryColors().primary90,
          backgroundColor: PrimaryColors().primary,
          disabledBackgroundColor: PrimaryColors().neutral20,
          splashFactory: InkSparkle.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56.r),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        hintStyle: TextStyle(
          fontFamily: 'Grotesk',
          fontSize: 14.sp,
          color: PrimaryColors().neutral40,
          height: getLineHeight(lineHeight: 22.4, fontSize: 14),
          letterSpacing: -0.5.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
        filled: false,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: PrimaryColors().primary, width: 1.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: PrimaryColors().neutral30, width: 1.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: PrimaryColors().neutral30, width: 1.r),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          // borderSide: BorderSide(color: appTheme.redA70001),
        ),
        errorStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13.sp,
          // color: appTheme.lightGray3,
        ),
      ),

      ///
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: PrimaryColors().white,
          side: BorderSide(
            color: PrimaryColors().primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1.r,
        space: 5.8.r,
        color: PrimaryColors().neutral40,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => PrimaryColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
      primary: Color.fromARGB(255, 19, 23, 21), secondary: Color(0XFFFFD700));
  static const primaryColorsSchemeDark = ColorScheme.dark();
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  Color get transparent => Colors.transparent;
  Color get barrierColor => const Color(0XFF475467).withOpacity(0.10);
  Color get primary => const Color(0XFF2ECC71);
  Color get secondary => const Color(0XFFFFD700);
  Color get textPrimary => PrimaryColors().neutral100;
  Color get textSecondary => PrimaryColors().neutral60;
  Color get textDisabled => PrimaryColors().neutral30;
  Color get textUtility => const Color(0XFF069952);
  Color get textWarning => const Color(0XFFEDA12F);
  Color get textDanger => const Color(0XFFE62E2E);
  Color get textInfo => const Color(0XFF0081CC);

  // Background Colors
  Color get bgDefault => PrimaryColors().primary60;
  Color get bgLightest => PrimaryColors().primary10;
  Color get bgPressed => const Color(0XFF0F4426);
  Color get bgPlaceholder => PrimaryColors().neutral10;
  Color get bgDisabled => PrimaryColors().neutral;
  Color get bgSuccess => const Color(0XFFE6FFF3).withOpacity(0.07);
  Color get bgWarning => const Color(0XFFFFF5E6);
  Color get bgDanger => const Color(0XFFFFE6E6);
  Color get bgInfo => const Color(0XFFE6F6FF);
  Color get overlay => const Color(0XFFFCFCFD);

// Primary Colors
  Color get primary10 => const Color(0XFFF4FFF9);
  Color get primary20 => const Color(0XFFB9EED0);
  Color get primary30 => const Color(0XFF96E5B8);
  Color get primary40 => const Color(0XFF74DDA0);
  Color get primary50 => const Color(0XFF51D489);
  Color get primary60 => const Color(0XFF2ECC71);
  Color get primary70 => const Color(0XFF1F884B);
  Color get primary80 => const Color(0XFF176638);
  Color get primary90 => const Color(0XFF092917);
  // Secondary Colors
  Color get secondary0 => const Color(0XFFFFFCE9);
  Color get secondary10 => const Color(0XFFFFF7CC);
  Color get secondary20 => const Color(0XFFFFF2AA);
  Color get secondary30 => const Color(0XFFFFEB80);
  Color get secondary40 => const Color(0XFFFFE455);
  Color get secondary50 => const Color(0XFFFFDE2A);
  Color get secondary60 => const Color(0XFFFFD700);
  Color get secondary70 => const Color(0XFFAA8F00);
  Color get secondary80 => const Color(0XFF806B00);
  Color get secondary90 => const Color(0XFF554800);
  Color get secondary100 => const Color(0XFF332B00);
// White
  Color get white => const Color(0XFFFFFFFF);
  Color get neutral => const Color(0XFFFCFCFD);
  Color get neutral10 => const Color(0XFFF9FAFB);
  Color get neutral20 => const Color(0XFFF2F4F7);
  Color get neutral30 => const Color(0XFFD0D5DD);
  Color get neutral40 => const Color(0XFF98A2B3);
  Color get neutral50 => const Color(0XFF98A2B3);
  Color get neutral60 => const Color(0XFF667085);
  Color get neutral70 => const Color(0XFF475467);
  Color get neutral80 => const Color(0XFF344054);
  Color get neutral90 => const Color(0XFF1D2939);
  Color get neutral100 => const Color(0XFF101323);
}
