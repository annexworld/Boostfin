import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttom_sheets/bottom_sheet.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({super.key});
  final BoxDecoration bottomSheetCard = BoxDecoration(
    color: appTheme.white,
    border: Border.all(
      color: appTheme.primary,
    ),
    borderRadius: BorderRadius.circular(6),
    boxShadow: [
      BoxShadow(
        color: appTheme.primary.withOpacity(0.5),
        offset: const Offset(0, 0),
        spreadRadius: 1.sp,
        blurRadius: 8.sp,
      ),
    ],
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          children: [
            // distance from stop of the display/screen
            86.verticalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 32.r),
                  child: SizedBox(
                    width: 48.9.h,
                    height: 49.w,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgLogo,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign up',
                    style: CustomTextStyles.bodyXLargeGrotesk_20x5.copyWith(
                        color: appTheme.textPrimary,
                        height: getLineHeight(lineHeight: 60, fontSize: 20),
                        letterSpacing: -0.5),
                  ),
                ),
                Text(
                  'Let’s get you started',
                  style: CustomTextStyles.bodyLargeGrotesk_16x5.copyWith(
                      color: appTheme.neutral60,
                      height: getLineHeight(lineHeight: 24, fontSize: 16),
                      letterSpacing: -0.5),
                ),
              ],
            ),
            32.verticalSpace,
            Form(
              child: Column(
                children: [
                  CustomTextFormField(
                    label: 'Email',
                    hintText: 'name@mail.com',
                  ),
                  16.verticalSpace,
                  CustomTextFormField(
                    label: 'Phone number',
                    hintText: '0800 000 0000',
                  )
                ],
              ),
            ),
            40.verticalSpace,
            CustomElevatedButton.withIcon(
              text: 'Continue',
              isDisabled: false,
              onPressed: () {
                //Open verify email modal
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomModalSheet(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.r),
                          child: Column(
                            children: [
                              28.verticalSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Verify Account',
                                            style: CustomTextStyles
                                                .h5Grotesk_24x6
                                                .copyWith(
                                              fontWeight: FontWeight.w500,
                                              height: getLineHeight(
                                                  lineHeight: 28.8,
                                                  fontSize: 24),
                                              letterSpacing: -0.3,
                                              color: appTheme.textPrimary,
                                            ),
                                          ),
                                          8.verticalSpace,
                                          Text(
                                            'Where would you like to receive your verification code?',
                                            style: CustomTextStyles
                                                .bodyLargeGrotesk_16x4
                                                .copyWith(
                                              height: getLineHeight(
                                                  lineHeight: 25.6,
                                                  fontSize: 16),
                                              letterSpacing: -0.1,
                                              color: appTheme.neutral60,
                                            ),
                                          ),
                                        ],
                                      ),
                                      24.verticalSpace,
                                      // Bottom sheet card
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.r, vertical: 8.r),
                                        decoration: bottomSheetCard,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 20.h,
                                              width: 20.w,
                                              margin:
                                                  EdgeInsets.only(right: 18.r),
                                              child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .svgRadioButtonIcon,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Email',
                                                  style: CustomTextStyles
                                                      .bodySmallGrotesk_14x4
                                                      .copyWith(
                                                          height: getLineHeight(
                                                              lineHeight: 25.6,
                                                              fontSize: 16),
                                                          letterSpacing: -0.5,
                                                          color: appTheme
                                                              .textPrimary),
                                                ),
                                                4.verticalSpace,
                                                Text(
                                                  'danielan...e@icloud.com',
                                                  style: CustomTextStyles
                                                      .bodySmallGrotesk_14x4
                                                      .copyWith(
                                                          height: getLineHeight(
                                                              lineHeight: 25.6,
                                                              fontSize: 16),
                                                          letterSpacing: -0.5,
                                                          color: appTheme
                                                              .neutral60),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            SizedBox(
                                              width: 18,
                                              height: 18,
                                              child: CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgLogo),
                                            ),
                                          ],
                                        ),
                                      ),
                                      8.verticalSpace,
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.r, vertical: 8.r),
                                        decoration: bottomSheetCard,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 20.h,
                                              width: 20.w,
                                              margin:
                                                  EdgeInsets.only(right: 18.r),
                                              child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .svgRadioButtonIcon,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Phone number',
                                                  style: CustomTextStyles
                                                      .bodySmallGrotesk_14x4
                                                      .copyWith(
                                                          height: getLineHeight(
                                                              lineHeight: 25.6,
                                                              fontSize: 16),
                                                          letterSpacing: -0.5,
                                                          color: appTheme
                                                              .textPrimary),
                                                ),
                                                4.verticalSpace,
                                                Text(
                                                  '0812......91',
                                                  style: CustomTextStyles
                                                      .bodySmallGrotesk_14x4
                                                      .copyWith(
                                                          height: getLineHeight(
                                                              lineHeight: 25.6,
                                                              fontSize: 16),
                                                          letterSpacing: -0.5,
                                                          color: appTheme
                                                              .neutral60),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            SizedBox(
                                              width: 18,
                                              height: 18,
                                              child: CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgLogo),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  40.verticalSpace,
                                  CustomElevatedButton.withIcon(
                                      isDisabled: false,
                                      onPressed: () {
                                        navigatorKey.currentState!.context
                                            .pop();
                                        GoRouter.of(context).push(
                                            "${Routes.signupPage.navigate}"
                                            "${Routes.verifyAccountPage.navigate}");
                                      },
                                      text: 'Send Code'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
            16.verticalSpace,
            GestureDetector(
              onTap: () {},
              child: RichText(
                text: TextSpan(
                    children: [
                      const TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Log In',
                        style: CustomTextStyles.bodyHostGrotesk.copyWith(
                          color: appTheme.primary,
                          fontWeight: FontWeight.w700,
                          height: getLineHeight(lineHeight: 24, fontSize: 14),
                        ),
                      ),
                    ],
                    style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                        color: appTheme.neutral60,
                        letterSpacing: 0.5,
                        height: getLineHeight(lineHeight: 22.4, fontSize: 14))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
