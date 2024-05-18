import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDecoration {
  // Black decorations
  static BoxDecoration get black => BoxDecoration(
        color: appTheme.white,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
// Fill decorations
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.white,
      );
// Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          // bottom: BorderSide(
          color: appTheme.neutral40,
          width: 1.h,
          // ),
        ),
      );
}

class CustomBoxShadow {
  static List<BoxShadow> level1 = [
    BoxShadow(
      blurRadius: 4.sp,
      spreadRadius: 2.sp,
      color: const Color(0xff101828).withOpacity(0.06),
      offset: Offset(
        0,
        2.sp,
      ),
    ),
    BoxShadow(
      blurRadius: 8.sp,
      spreadRadius: 2.sp,
      color: const Color(0xff101828).withOpacity(0.08),
      offset: Offset(
        0,
        4.sp,
      ),
    )
  ];
  static List<BoxShadow> level2 = [
    BoxShadow(
      blurRadius: 6.sp,
      spreadRadius: 2.sp,
      color: const Color(0xff101828).withOpacity(0.03),
      offset: Offset(
        0,
        4.sp,
      ),
    ),
    BoxShadow(
      blurRadius: 16.sp,
      spreadRadius: -4.sp,
      color: const Color(0xff101828).withOpacity(0.08),
      offset: Offset(
        0,
        12.sp,
      ),
    )
  ];

  static List<BoxShadow> level3 = [
    BoxShadow(
      blurRadius: 8.sp,
      spreadRadius: 4.sp,
      color: const Color(0xff101828).withOpacity(0.03),
      offset: Offset.zero,
    ),
    BoxShadow(
      blurRadius: 24.sp,
      spreadRadius: -4.sp,
      color: const Color(0xff101828).withOpacity(0.08),
      offset: Offset.zero,
    )
  ];

  static List<BoxShadow> level4 = [
    BoxShadow(
      blurRadius: 48.sp,
      spreadRadius: -12.sp,
      color: const Color(0xff101828).withOpacity(0.18),
      offset: Offset(0, 24.sp),
    ),
  ];

  static List<BoxShadow> level5 = [
    BoxShadow(
      blurRadius: 64.sp,
      spreadRadius: -12.sp,
      color: const Color(0xff101828).withOpacity(0.14),
      offset: Offset.zero,
    ),
  ];
}

class CustomBorderRadius {
  /// Circle borders.all() 4px
  static BorderRadius get smallBorder => BorderRadius.circular(4.r);

  /// Cicular border.all() 8px
  static BorderRadius get standardBorder => BorderRadius.circular(8.r);

  /// Cicular border.all() 24px
  static BorderRadius get roundedBorder15 => BorderRadius.circular(24.r);

  /// Cicular border.all() 40px
  static BorderRadius get roundedBorder4 => BorderRadius.circular(40.r);
}
