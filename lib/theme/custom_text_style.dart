import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double getLineHeight({required double lineHeight, required double fontSize}) {
  return (lineHeight / fontSize).sp;
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get grotesk {
    return copyWith(
      fontFamily: 'Grotesk',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body style
  static TextStyle get bodyHostGrotesk => theme.textTheme.bodyLarge!;

  ///
  static TextStyle get h1Grotesk_60x7 => bodyHostGrotesk.copyWith(
      fontSize: 60.sp,
      fontWeight: FontWeight.w700,
      height: getLineHeight(lineHeight: 120, fontSize: 60),
      letterSpacing: -0.5);
  static TextStyle get h1Grotesk_60x6 => bodyHostGrotesk.copyWith(
      fontSize: 60.sp,
      fontWeight: FontWeight.w600,
      height: getLineHeight(lineHeight: 120, fontSize: 60),
      letterSpacing: -0.5);

  ///
  static TextStyle get h2Grotesk_49x7 => bodyHostGrotesk.copyWith(
      fontSize: 49.sp,
      fontWeight: FontWeight.w700,
      height: getLineHeight(lineHeight: 120, fontSize: 49),
      letterSpacing: -0.5);
  static TextStyle get h2Grotesk_49x6 => bodyHostGrotesk.copyWith(
      fontSize: 49.sp,
      fontWeight: FontWeight.w600,
      height: getLineHeight(lineHeight: 120, fontSize: 49),
      letterSpacing: -0.5);

  ///
  static TextStyle get h3Grotesk_39x7 => bodyHostGrotesk.copyWith(
      fontSize: 39.sp,
      fontWeight: FontWeight.w700,
      height: getLineHeight(lineHeight: 120, fontSize: 39),
      letterSpacing: -0.5);
  static TextStyle get h3Grotesk_39x6 => bodyHostGrotesk.copyWith(
      fontSize: 39.sp,
      fontWeight: FontWeight.w600,
      height: getLineHeight(lineHeight: 120, fontSize: 39),
      letterSpacing: -0.5);

  ///
  static TextStyle get h4Grotesk_32x7 => bodyHostGrotesk.copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      height: getLineHeight(lineHeight: 120, fontSize: 32),
      letterSpacing: -0.5);
  static TextStyle get h4Grotesk_32x6 => bodyHostGrotesk.copyWith(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      height: getLineHeight(lineHeight: 120, fontSize: 32),
      letterSpacing: -0.5);

  ///
  static TextStyle get h5Grotesk_24x7 => bodyHostGrotesk.copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      height: getLineHeight(lineHeight: 120, fontSize: 24),
      letterSpacing: -0.5);
  static TextStyle get h5Grotesk_24x6 => bodyHostGrotesk.copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      height: getLineHeight(lineHeight: 120, fontSize: 24),
      letterSpacing: -0.5);

  ///
  static TextStyle get bodyXLargeGrotesk_20x5 => bodyHostGrotesk.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      height: getLineHeight(lineHeight: 120, fontSize: 20),
      letterSpacing: -0.25);
  static TextStyle get bodyXLargeGrotesk_20x4 => bodyHostGrotesk.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      height: getLineHeight(lineHeight: 120, fontSize: 20),
      letterSpacing: -0.25);

  ///
  static TextStyle get bodyLargeGrotesk_16x5 => bodyHostGrotesk.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      height: getLineHeight(lineHeight: 160, fontSize: 16),
      letterSpacing: -0.25);
  static TextStyle get bodyLargeGrotesk_16x4 => bodyHostGrotesk.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      height: getLineHeight(lineHeight: 160, fontSize: 16),
      letterSpacing: -0.25);

  ///
  static TextStyle get bodySmallGrotesk_14x5 => bodyHostGrotesk.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      height: getLineHeight(lineHeight: 160, fontSize: 14),
      letterSpacing: -0.25);
  static TextStyle get bodySmallGrotesk_14x4 => bodyHostGrotesk.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: getLineHeight(lineHeight: 22.4, fontSize: 14),
      letterSpacing: -0.25);

  ///
  static TextStyle get bodyXSmallGrotesk_12x5 => bodyHostGrotesk.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      height: getLineHeight(lineHeight: 160, fontSize: 12),
      letterSpacing: -0.25);
  static TextStyle get bodyXSmallGrotesk_12x4 => bodyHostGrotesk.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      height: getLineHeight(lineHeight: 19.2, fontSize: 12),
      letterSpacing: -0.25);

  ///
  static TextStyle get buttonLargeText => bodyHostGrotesk.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      height: getLineHeight(lineHeight: 25.6, fontSize: 16),
      letterSpacing: -0.25);

  ///
  static TextStyle get buttonSmallText => bodyHostGrotesk.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      height: getLineHeight(lineHeight: 25.6, fontSize: 14),
      letterSpacing: -0.25);

  static TextStyle get linkLargeStyle => bodyHostGrotesk.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      height: getLineHeight(lineHeight: 24, fontSize: 16),
      letterSpacing: -0.25);

  ///
  static TextStyle get linkSmallStyle => bodyHostGrotesk.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      height: getLineHeight(lineHeight: 20, fontSize: 14),
      letterSpacing: -0.25);
}
