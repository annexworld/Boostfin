import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});
  //
  static TextStyle get titleStyle =>
      CustomTextStyles.bodyLargeGrotesk_16x5.copyWith(
          height: getLineHeight(lineHeight: 21.6, fontSize: 16),
          letterSpacing: -.8.sp);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          32.verticalSpace,
          Container(
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome back',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                        color: appTheme.white,
                        height: getLineHeight(lineHeight: 0, fontSize: 14),
                        letterSpacing: .5.sp,
                      ),
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'boring company'.capitalize!,
                          style:
                              CustomTextStyles.bodySmallGrotesk_14x5.copyWith(
                            color: appTheme.white,
                            fontSize: 18.sp,
                            height: getLineHeight(lineHeight: 0, fontSize: 14),
                            letterSpacing: .5.sp,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.r),
                          child: CustomImageView(
                            imagePath: ImageConstant.svgLeftArrowIcon,
                            color: appTheme.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 80.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: appTheme.primary50,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(11.r),
                        child: CustomImageView(
                            imagePath: ImageConstant.svgNotificationBell,
                            color: appTheme.white),
                      ),
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: appTheme.primary50,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(11.r),
                        child: CustomImageView(
                            imagePath: ImageConstant.svgCTAicon,
                            color: appTheme.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 84.h);
}
