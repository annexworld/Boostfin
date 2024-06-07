import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/authentication/notifier/create_user_password_state.notifier.dart';
import 'package:boostfin/ui_layer/widgets/custom_alert.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordPage extends ConsumerWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateRef = ref.watch(createUserPasswordStateNotifierProvider);
    final readRef = ref.read(createUserPasswordStateNotifierProvider.notifier);
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
                  'Your new password must be different from your previously used passwords',
                  style: CustomTextStyles.bodyLargeGrotesk_16x4.copyWith(
                      color: appTheme.neutral60,
                      height: getLineHeight(lineHeight: 25.6, fontSize: 16),
                      letterSpacing: -0.5),
                ),
              ],
            ),
            24.verticalSpace,
            Form(
              key: stateRef.formKey,
              child: Column(
                children: [
                  CustomTextFormField.password(
                    controller: stateRef.passwordOldController,
                    label: 'Create Password',
                    hintText: 'Password',
                    onChanged: (value) {
                      readRef.passwordValid(value);
                    },
                  ),
                  16.verticalSpace,
                  CustomTextFormField.password(
                    controller: stateRef.passwordNewController,
                    label: 'Confirm Password',
                    hintText: 'Re-enter password',
                  ),
                ],
              ),
            ),
            24.verticalSpace,

            // todo: add animation for effect
            Visibility(
              visible: stateRef.isValidPassword ?? false,
              child: CustomElevatedButton.withIcon(
                onPressed: () {
                  GoRouter.of(context).push("${Routes.signupPage.navigate}"
                      "${Routes.registerBVNPage.navigate}");
                },
                text: 'Continue',
              ),
            ),
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
                      child: CustomImageView(
                          imagePath: stateRef.hasOneLowerCaseString ?? false
                              ? ImageConstant.svgPasswordCheckValid
                              : ImageConstant.svgPasswordCheck),
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
                9.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 8.r),
                        width: 20.w,
                        height: 20.h,
                        child: CustomImageView(
                            imagePath: stateRef.hasOneUpperCaseString ?? false
                                ? ImageConstant.svgPasswordCheckValid
                                : ImageConstant.svgPasswordCheck)),
                    Text(
                      'One uppercase character',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 22.5, fontSize: 14),
                          letterSpacing: -0.5),
                    ),
                  ],
                ),
                9.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 8.r),
                        width: 20.w,
                        height: 20.h,
                        child: CustomImageView(
                            imagePath: stateRef.hasOneDigitCaseString ?? false
                                ? ImageConstant.svgPasswordCheckValid
                                : ImageConstant.svgPasswordCheck)),
                    Text(
                      'One number',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 22.5, fontSize: 14),
                          letterSpacing: -0.5),
                    ),
                  ],
                ),
                9.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 8.r),
                        width: 20.w,
                        height: 20.h,
                        child: CustomImageView(
                            imagePath: stateRef.hasSpecialCharacter ?? false
                                ? ImageConstant.svgPasswordCheckValid
                                : ImageConstant.svgPasswordCheck)),
                    Text(
                      'One special character',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 22.5, fontSize: 14),
                          letterSpacing: -0.5),
                    ),
                  ],
                ),
                9.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 8.r),
                        width: 20.w,
                        height: 20.h,
                        child: CustomImageView(
                            imagePath: stateRef.isMinimumOfSix ?? false
                                ? ImageConstant.svgPasswordCheckValid
                                : ImageConstant.svgPasswordCheck)),
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
            24.verticalSpace,
            CustomElevatedButton.withIcon(
              text: 'Reset Password',
              onPressed: () {
                showDialog(
                    barrierColor: appTheme.transparent,
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: appTheme.transparent,
                        elevation: 0.0,
                        child: CustomAlertDialog(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 72.w,
                                height: 72.h,
                                decoration: BoxDecoration(
                                  color: appTheme.primary10,
                                  shape: BoxShape.circle,
                                ),
                                margin: EdgeInsets.only(bottom: 24.r),
                                child: CustomImageView(
                                  imagePath: ImageConstant.svgSuccessConfetti,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0.r),
                                child: Text(
                                  'Password Reset',
                                  style: CustomTextStyles.h5Grotesk_24x6
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -.25.sp,
                                          height: getLineHeight(
                                              lineHeight: 28.8, fontSize: 24)),
                                ),
                              ),
                              Text(
                                'Your password has been successfully reset. Click below to login magically.',
                                style: CustomTextStyles.bodyLargeGrotesk_16x4
                                    .copyWith(
                                  color: appTheme.neutral60,
                                  letterSpacing: -.5.sp,
                                  height: getLineHeight(
                                      lineHeight: 25.6, fontSize: 24),
                                ),
                              ),
                              32.verticalSpace,
                              CustomElevatedButton.withIcon(
                                  width: double.infinity,
                                  onPressed: () {
                                    GoRouter.of(context)
                                        .go(Routes.signinPage.navigate);
                                  },
                                  text: 'Continue'),
                              8.verticalSpace,
                              CustomElevatedButton(
                                buttonStyle: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor: MaterialStateProperty.all(
                                        appTheme.transparent)),
                                textColor: appTheme.primary,
                                width: double.infinity,
                                onPressed: () {
                                  GoRouter.of(context)
                                      .go(Routes.signinPage.navigate);
                                },
                                text: "Back to Login",
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
