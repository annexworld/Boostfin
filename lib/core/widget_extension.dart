import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on SizedBox {
  SizedBox addFormLabel({required String label, required bool isRequired}) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 22.h,
              width: this.width,
              child: isRequired
                  ? RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                            color: appTheme.primary90, letterSpacing: -0.25.sp),
                        children: [
                          TextSpan(text: label),
                          TextSpan(
                            text: ' *',
                            style: CustomTextStyles.bodySmallGrotesk_14x4
                                .copyWith(color: appTheme.textWarning),
                          )
                        ],
                      ),
                    )
                  : Text(
                      label,
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.primary90, letterSpacing: -0.25.sp),
                    )),
          8.verticalSpace,
          this.child!,
        ],
      ),
    );
  }
}
