import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/onboarding/widgets/account_verification_sheet.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttom_sheets/bottom_sheet.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({super.key});

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
                      return const CustomBottomModalSheet(
                          child: AccountVerificationBottomSheet());
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
