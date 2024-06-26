import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/authentication/widget/validate_password_reset_sheet.widget.dart';
import 'package:boostfin/ui_layer/onboarding/notifiers/signup_state_one.notifier.dart';
import 'package:boostfin/ui_layer/onboarding/state/user_signup.state.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttom_sheets/bottom_sheet.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

class ForgotPasswordBottomSheet extends ConsumerWidget {
  const ForgotPasswordBottomSheet({super.key});

  // BoxDecoration get bottomSheetCardSelected => BoxDecoration(
  //       color: appTheme.white,
  //       border: Border.all(
  //         color: appTheme.primary,
  //       ),
  //       borderRadius: BorderRadius.circular(6),
  //       boxShadow: [
  //         BoxShadow(
  //           color: appTheme.primary.withOpacity(0.5),
  //           offset: const Offset(0, 0),
  //           spreadRadius: 1.sp,
  //           blurRadius: 8.sp,
  //         ),
  //       ],
  //     );

  // BoxDecoration get bottomSheetCardUnSelected => BoxDecoration(
  //       color: appTheme.white,
  //       border: Border.all(
  //         color: appTheme.neutral30,
  //       ),
  //       borderRadius: BorderRadius.circular(6),
  //     );

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
                        'Forgot Password',
                        style: CustomTextStyles.h5Grotesk_24x6.copyWith(
                          fontWeight: FontWeight.w500,
                          height: getLineHeight(lineHeight: 28.8, fontSize: 24),
                          letterSpacing: -0.3,
                          color: appTheme.textPrimary,
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'No worries, we’ll send you reset instructions',
                        style: CustomTextStyles.bodyLargeGrotesk_16x4.copyWith(
                          height: getLineHeight(lineHeight: 25.6, fontSize: 16),
                          letterSpacing: -0.1,
                          color: appTheme.neutral60,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Form(
                      child: CustomTextFormField(
                    label: 'Email',
                    hintText: 'name@mail.com',
                  )),
                ],
              ),
              40.verticalSpace,
              CustomElevatedButton(
                  width: double.infinity,
                  onPressed: () {
                    GoRouter.of(context).pop(); // Open password reset modal
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomBottomModalSheet(
                              height: 436,
                              child: ValidatePasswordResetBottomSheet());
                        });
                  },
                  text: 'Send Instructions'),
              8.verticalSpace,
              CustomElevatedButton(
                buttonStyle: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(appTheme.transparent)),
                textColor: appTheme.primary,
                width: double.infinity,
                onPressed: () {},
                text: "Back to Login",
              )
            ],
          ),
        ],
      ),
    );
  }
}
