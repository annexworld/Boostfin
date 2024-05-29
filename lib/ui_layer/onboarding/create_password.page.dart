import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateUserPasswordPage extends ConsumerWidget {
  const CreateUserPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Password',
                  style: CustomTextStyles.bodyXLargeGrotesk_20x5.copyWith(
                      color: appTheme.textPrimary,
                      height: getLineHeight(lineHeight: 60, fontSize: 20),
                      letterSpacing: -0.5),
                ),
                Text(
                  'Please create a password',
                  style: CustomTextStyles.bodyLargeGrotesk_16x4.copyWith(
                      color: appTheme.neutral60,
                      height: getLineHeight(lineHeight: 25.6, fontSize: 16),
                      letterSpacing: -0.5),
                ),
              ],
            ),
            24.verticalSpace,
            Form(
              key: null,
              child: Column(
                children: [
                  CustomTextFormField.password(
                    label: 'Create Password',
                    hintText: 'Password',
                  ),
                  16.verticalSpace,
                  CustomTextFormField.password(
                    label: 'Confirm Password',
                    hintText: 'Re-enter password',
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.r),
                      width: 20.w,
                      height: 20.h,
                      padding: EdgeInsets.all(8.r),
                      child: CustomImageView(
                          imagePath: ImageConstant.svgRadioButtonIcon),
                    ),
                    Text(
                      'One lowercase character',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 22.5, fontSize: 14),
                          letterSpacing: -0.5),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.r),
                      width: 20.w,
                      height: 20.h,
                      padding: EdgeInsets.all(8.r),
                      child: CustomImageView(
                          imagePath: ImageConstant.svgRadioButtonIcon),
                    ),
                    Text(
                      'One uppercase character',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 22.5, fontSize: 14),
                          letterSpacing: -0.5),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.r),
                      width: 20.w,
                      height: 20.h,
                      padding: EdgeInsets.all(8.r),
                      child: CustomImageView(
                          imagePath: ImageConstant.svgRadioButtonIcon),
                    ),
                    Text(
                      'One number',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 22.5, fontSize: 14),
                          letterSpacing: -0.5),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.r),
                      width: 20.w,
                      height: 20.h,
                      padding: EdgeInsets.all(8.r),
                      child: CustomImageView(
                          imagePath: ImageConstant.svgRadioButtonIcon),
                    ),
                    Text(
                      'One special character',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 22.5, fontSize: 14),
                          letterSpacing: -0.5),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.r),
                      width: 20.w,
                      height: 20.h,
                      padding: EdgeInsets.all(8.r),
                      child: CustomImageView(
                          imagePath: ImageConstant.svgRadioButtonIcon),
                    ),
                    Text(
                      '6 characters minimum',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 22.5, fontSize: 14),
                          letterSpacing: -0.5),
                    ),
                  ],
                ),
              ],
            ),
            CustomElevatedButton.withIcon(
              onPressed: () {
                GoRouter.of(context).push("${Routes.signupPage.navigate}"
                    "${Routes.registerBVNPage.navigate}");
              },
              text: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
