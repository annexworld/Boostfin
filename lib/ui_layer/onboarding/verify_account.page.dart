import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:boostfin/ui_layer/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyDetailsPage extends ConsumerWidget {
  const VerifyDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          children: [
            16.verticalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Account',
                  style: CustomTextStyles.bodyXLargeGrotesk_20x5.copyWith(
                      color: appTheme.textPrimary,
                      height: getLineHeight(lineHeight: 60, fontSize: 20),
                      letterSpacing: -0.5),
                ),
                Text(
                  'Enter the code sent to d.....e@icloud.com',
                  style: CustomTextStyles.bodyLargeGrotesk_16x5.copyWith(
                      color: appTheme.neutral60,
                      height: getLineHeight(lineHeight: 24, fontSize: 16),
                      letterSpacing: -0.5),
                ),
                24.verticalSpace,
                Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        label: 'Email',
                        hintText: 'name@mail.com',
                      ),
                      16.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: RichText(
                              text: TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: 'Didn’t receive the code? '),
                                    TextSpan(
                                      text: 'Resend',
                                      style: CustomTextStyles.bodyHostGrotesk
                                          .copyWith(
                                        color: appTheme.primary,
                                        fontWeight: FontWeight.w700,
                                        height: getLineHeight(
                                            lineHeight: 24, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                  style: CustomTextStyles.bodySmallGrotesk_14x4
                                      .copyWith(
                                          color: appTheme.neutral60,
                                          letterSpacing: 0.5,
                                          height: getLineHeight(
                                              lineHeight: 22.4, fontSize: 14))),
                            ),
                          ),
                          Text(
                            '00:54',
                            style:
                                CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                              color: appTheme.neutral60,
                              letterSpacing: 0.5,
                              height:
                                  getLineHeight(lineHeight: 22.4, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      40.verticalSpace,
                      CustomElevatedButton.withIcon(
                        onPressed: () {},
                        isDisabled: false,
                        text: 'Verify Account',
                      )
                    ],
                  ),
                ),
                40.verticalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
