import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/onboarding/notifiers/signup_state_one.notifier.dart';
import 'package:boostfin/ui_layer/onboarding/state/user_signup.state.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

class AccountVerificationBottomSheet extends ConsumerWidget {
  const AccountVerificationBottomSheet(
      {super.key, required this.email, required this.phoneNumber});

  final String email;
  final String phoneNumber;

  BoxDecoration get bottomSheetCardSelected => BoxDecoration(
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
  BoxDecoration get bottomSheetCardUnSelected => BoxDecoration(
        color: appTheme.white,
        border: Border.all(
          color: appTheme.neutral30,
        ),
        borderRadius: BorderRadius.circular(6),
      );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateRef = ref.watch(userSignupStateNotifierProvider);
    final readRef = ref.read(userSignupStateNotifierProvider.notifier);

    return Padding(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verify Account',
                        style: CustomTextStyles.h5Grotesk_24x6.copyWith(
                          fontWeight: FontWeight.w500,
                          height: getLineHeight(lineHeight: 28.8, fontSize: 24),
                          letterSpacing: -0.3,
                          color: appTheme.textPrimary,
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Where would you like to receive your verification code?',
                        style: CustomTextStyles.bodyLargeGrotesk_16x4.copyWith(
                          height: getLineHeight(lineHeight: 25.6, fontSize: 16),
                          letterSpacing: -0.1,
                          color: appTheme.neutral60,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  // Bottom sheet card
                  GestureDetector(
                    onTap: () {
                      readRef.setVerificationMethod =
                          SignupVerificationType.email;
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                      decoration: stateRef.verificationType!.type == 0
                          ? bottomSheetCardSelected
                          : bottomSheetCardUnSelected,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 20.h,
                            width: 20.w,
                            margin: EdgeInsets.only(right: 18.r),
                            child: CustomImageView(
                              imagePath: stateRef.verificationType!.type == 0
                                  ? ImageConstant.svgRadioButtonIcon
                                  : ImageConstant.svgRadioButtonOutlineIcon,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        height: getLineHeight(
                                            lineHeight: 25.6, fontSize: 16),
                                        letterSpacing: -0.5,
                                        color: appTheme.textPrimary),
                              ),
                              4.verticalSpace,
                              Text(
                                email.maskEmail,
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        height: getLineHeight(
                                            lineHeight: 25.6, fontSize: 16),
                                        letterSpacing: -0.5,
                                        color: appTheme.neutral60),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CustomImageView(
                                imagePath: ImageConstant.svgEmailIconOutline),
                          ),
                        ],
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      readRef.setVerificationMethod =
                          SignupVerificationType.phone;
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                      decoration: stateRef.verificationType!.type == 1
                          ? bottomSheetCardSelected
                          : bottomSheetCardUnSelected,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 20.h,
                            width: 20.w,
                            margin: EdgeInsets.only(right: 18.r),
                            child: CustomImageView(
                              imagePath: stateRef.verificationType!.type == 1
                                  ? ImageConstant.svgRadioButtonIcon
                                  : ImageConstant.svgRadioButtonOutlineIcon,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone number',
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        height: getLineHeight(
                                            lineHeight: 25.6, fontSize: 16),
                                        letterSpacing: -0.5,
                                        color: appTheme.textPrimary),
                              ),
                              4.verticalSpace,
                              Text(
                                phoneNumber,
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        height: getLineHeight(
                                            lineHeight: 25.6, fontSize: 16),
                                        letterSpacing: -0.5,
                                        color: appTheme.neutral60),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CustomImageView(
                                imagePath: ImageConstant.svgPhoneIcon),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              CustomElevatedButton.withIcon(
                  isDisabled: stateRef.loadingState,
                  isloading: stateRef.loadingState,
                  onPressed: () {
                    GoRouter.of(context).push("${Routes.signupPage.navigate}"
                        "${Routes.verifyAccountPage.navigate}");
                    // readRef.verifyAccount(email, phoneNumber, context: context);
                  },
                  text: 'Send Code'),
            ],
          ),
        ],
      ),
    );
  }
}
