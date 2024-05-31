import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/onboarding/notifiers/signup_state_one.notifier.dart';
import 'package:boostfin/ui_layer/onboarding/widgets/account_verification_sheet.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttom_sheets/bottom_sheet.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:boostfin/routes.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateRef = ref.watch(userSignupStateNotifierProvider);
    final readRef = ref.read(userSignupStateNotifierProvider.notifier);

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
                    'Welcome Back Daniel.',
                    style: CustomTextStyles.bodyXLargeGrotesk_20x5.copyWith(
                        color: appTheme.textPrimary,
                        height: getLineHeight(lineHeight: 60, fontSize: 20),
                        letterSpacing: -0.5),
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: 'Not your account?',
                        style: CustomTextStyles.bodyLargeGrotesk_16x5.copyWith(
                            color: appTheme.neutral60,
                            height: getLineHeight(lineHeight: 24, fontSize: 16),
                            letterSpacing: -0.5),
                        children: [
                      TextSpan(
                        text: ' Log Out',
                        style: CustomTextStyles.bodyLargeGrotesk_16x5.copyWith(
                            color: appTheme.neutral100,
                            height: getLineHeight(lineHeight: 24, fontSize: 16),
                            letterSpacing: -0.5,
                            decoration: TextDecoration.underline),
                      )
                    ])),
              ],
            ),
            32.verticalSpace,
            Form(
              // key: stateRef.formKey,
              child: Column(
                children: [
                  CustomTextFormField.numberOnly(
                    inputFormatters: [stateRef.textInputFormatter!],
                    controller: stateRef.phoneNoController,
                    validator: stateRef.validatePhoneNoFormInput,
                    label: 'Phone number',
                    hintText: '+234 800 490 6891',
                  ),
                  16.verticalSpace,
                  CustomTextFormField.password(
                    controller: stateRef.emailController,
                    validator: stateRef.validateEmailFormInput,
                    label: 'Password',
                    hintText: '',
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 25.w,
                        child: Transform.scale(
                          scale: 0.7,
                          child: Checkbox(
                              value: true,
                              onChanged: (condition) {},
                              checkColor: appTheme.white,
                              fillColor: MaterialStateProperty.all<Color>(
                                  appTheme.primary60)),
                        ),
                      ),
                      Text(
                        'Remember me',
                        style: CustomTextStyles.bodySmallGrotesk_14x5.copyWith(
                            height: getLineHeight(
                                lineHeight: 22.h, fontSize: 14.sp)),
                      ),
                    ],
                  ),
                ),
                Text('Forgot password',
                    style: CustomTextStyles.bodyXSmallGrotesk_12x5.copyWith(
                        color: appTheme.primary60,
                        height:
                            getLineHeight(lineHeight: 22.h, fontSize: 12.sp)))
              ],
            ),
            40.verticalSpace,
            CustomElevatedButton(
              text: 'Log in With Face ID',
              isDisabled: stateRef.loadingState,
              isloading: stateRef.loadingState,
              onPressed: () async {
// GoRouter.of(context).push("${Routes.signupPage.navigate}""${Routes.signinPage.navigate}");
                if (readRef.validateSignupForm(context)) {
                  // Open verify email modal
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomBottomModalSheet(
                            child: AccountVerificationBottomSheet(
                          email: stateRef.emailController!.text,
                          phoneNumber:
                              stateRef.textInputFormatter!.getUnmaskedText(),
                        ));
                      });
                }
                GoRouter.of(context).push("${Routes.signupPage.navigate}"
                    "${Routes.signinPage.navigate}");
              },
            ),
            200.verticalSpace,
            GestureDetector(
                onTap: () {},
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '© BoostFin. (Licensed by the Central Bank of Nigeria)',
                      style: CustomTextStyles.bodyXSmallGrotesk_12x4,
                    )))
          ],
        ),
      ),
    );
  }
}
