import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/authentication/notifier/signin_state.notifier.dart';
import 'package:boostfin/ui_layer/authentication/widget/forgot_password_sheet.widget.dart';
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
    final stateRef = ref.watch(signinStateNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              43.verticalSpace,
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
                          style: CustomTextStyles.bodyLargeGrotesk_16x5
                              .copyWith(
                                  color: appTheme.neutral100,
                                  height: getLineHeight(
                                      lineHeight: 24, fontSize: 16),
                                  letterSpacing: -0.5,
                                  decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              32.verticalSpace,
              Form(
                key: stateRef.formKey,
                child: Column(
                  children: [
                    CustomTextFormField.numberOnly(
                      inputFormatters: [stateRef.textInputFormatter],
                      controller: stateRef.phoneControlller,
                      validator: stateRef.phoneNumberValidator,
                      label: 'Phone number',
                      hintText: '0800 000 0000',
                    ),
                    16.verticalSpace,
                    CustomTextFormField.password(
                      controller: stateRef.passwordController,
                      validator: stateRef.passwordValidator,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 25.w,
                          child: Transform.scale(
                            scale: 0.95,
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
                          style: CustomTextStyles.bodySmallGrotesk_14x5
                              .copyWith(
                                  height: getLineHeight(
                                      lineHeight: 22.h, fontSize: 14.sp)),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Open password reset modal
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomBottomModalSheet(
                                height: 398,
                                child: ForgotPasswordBottomSheet());
                          });
                    },
                    child: Text('Forgot password',
                        style: CustomTextStyles.bodyXSmallGrotesk_12x5.copyWith(
                            color: appTheme.primary60,
                          height: getLineHeight(
                                lineHeight: 22.h, fontSize: 12.sp))),
                  ),
                ],
              ),
              40.verticalSpace,
              CustomElevatedButton(
                width: double.infinity,
                text: 'Log in With Face ID',
                isDisabled: stateRef.isloading,
                isloading: stateRef.isloading,
                onPressed: () {
                  ref
                      .read(signinStateNotifierProvider.notifier)
                      .validateCredentials(context);
                },
              ),
              180.verticalSpace,
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
      ),
    );
  }
}
