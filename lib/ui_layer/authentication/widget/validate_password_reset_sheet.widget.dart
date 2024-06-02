import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/app_decoration.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

class ValidatePasswordResetBottomSheet extends ConsumerWidget {
  const ValidatePasswordResetBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final stateRef = ref.watch();
    // final readRef = ref.read(.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        children: [
          28.verticalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 44.h,
                width: 44.w,
                margin: EdgeInsets.only(bottom: 24.r),
                decoration: BoxDecoration(
                  boxShadow: CustomBoxShadow.level1,
                  color: appTheme.white,
                  border: Border.all(
                    color: appTheme.primary,
                    width: 0.4.r,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CustomImageView(
                  fit: BoxFit.scaleDown,
                  imagePath: ImageConstant.svgEmailIcon,
                  color: appTheme.primary,
                ),
              ),
              Text(
                'Check your email',
                style: CustomTextStyles.h5Grotesk_24x6.copyWith(
                  fontWeight: FontWeight.w500,
                  height: getLineHeight(lineHeight: 28.8, fontSize: 24),
                  letterSpacing: -0.3,
                  color: appTheme.textPrimary,
                ),
              ),
              8.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'We sent an OTP to dani*******e@icloud.com to reset your password',
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeGrotesk_16x4.copyWith(
                    height: getLineHeight(lineHeight: 25.6, fontSize: 16),
                    letterSpacing: -0.1,
                    color: appTheme.neutral60,
                  ),
                ),
              ),
              40.verticalSpace,
              CustomElevatedButton.withIcon(
                  width: double.infinity,
                  icon: ImageConstant.svgEmailIcon,
                  onPressed: () {
                    GoRouter.of(context).pop();
                    //todo: open gmail from here

                    GoRouter.of(context).push(
                        "${Routes.signinPage.navigate}${Routes.createNewPasswordPage.navigate}");
                  },
                  text: 'Open email app'),
              8.verticalSpace,
              GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    text: 'Didn’t receive the email?',
                    style: CustomTextStyles.bodyLargeGrotesk_16x5.copyWith(
                        color: appTheme.neutral60,
                        height: getLineHeight(lineHeight: 24, fontSize: 16),
                        letterSpacing: -0.5),
                    children: [
                      TextSpan(
                        text: ' Resend',
                        style: CustomTextStyles.bodyLargeGrotesk_16x5.copyWith(
                          color: appTheme.primary,
                          height: getLineHeight(lineHeight: 24, fontSize: 16),
                          letterSpacing: -0.5,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              8.verticalSpace,
              CustomElevatedButton(
                buttonStyle: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(appTheme.transparent)),
                textColor: appTheme.primary,
                width: double.infinity,
                onPressed: () {
                  context.pop();
                },
                text: "Back to Login",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
