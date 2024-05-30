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

class ProvideBVNPage extends ConsumerWidget {
  const ProvideBVNPage({super.key});

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
                  'Provide your BVN',
                  style: CustomTextStyles.bodyXLargeGrotesk_20x5.copyWith(
                      color: appTheme.textPrimary,
                      height: getLineHeight(lineHeight: 60, fontSize: 20),
                      letterSpacing: -0.5),
                ),
                Text(
                  'Enter your Bank Verification Number',
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
                  CustomTextFormField(
                    label: 'BVN',
                    hintText: 'Enter your BVN',
                  ),
                  24.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border(
                          left: BorderSide(
                              width: 4, color: appTheme.outlineWarning),
                          bottom: BorderSide(
                              width: 1, color: appTheme.outlineWarning),
                          right: BorderSide(
                              width: 1, color: appTheme.outlineWarning),
                          top: BorderSide(
                              width: 1, color: appTheme.outlineWarning),
                        )),
                    child: ExpansionTile(
                      
                      backgroundColor: appTheme.expansionWarning,
                      collapsedBackgroundColor: appTheme.bgWarning,
                      title: Row(
                        children: [
                          SizedBox(
                            child: CustomImageView(
                              fit: BoxFit.scaleDown,
                              imagePath: ImageConstant.svgWarning,
                            ),
                          ),
                          15.horizontalSpace,
                          Text(
                            'Find out why we need your BVN',
                            style: CustomTextStyles.bodySmallGrotesk_14x4,
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What is a BVN?',
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        height: getLineHeight(
                                            lineHeight: 22.4, fontSize: 14.sp)),
                              ),
                              Text(
                                'This is your bank verification number which is unique to each person.',
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        color: appTheme.neutral60,
                                        height: getLineHeight(
                                            lineHeight: 22.4, fontSize: 14.sp)),
                              ),
                              12.verticalSpace,
                              Text(
                                'Why do we ask for it?',
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        height: getLineHeight(
                                            lineHeight: 22.4, fontSize: 14.sp)),
                              ),
                              Text(
                                'We request for your BVN to verify your identity and confirm that the account you registered with is yours. It is also a KYC requirement for all financial institutions by the Central Bank of Nigeria (CBN).',
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        color: appTheme.neutral60,
                                        height: getLineHeight(
                                            lineHeight: 22.4, fontSize: 14.sp)),
                              ),
                              12.verticalSpace,
                              Text(
                                'Where can you find it?',
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        height: getLineHeight(
                                            lineHeight: 22.4, fontSize: 14.sp)),
                              ),
                              Text(
                                'To know your BVN, dial *565*0# from the phone number linked to your bank account. Please note that your provider may charge N20 for each check.',
                                style: CustomTextStyles.bodySmallGrotesk_14x4
                                    .copyWith(
                                        color: appTheme.neutral60,
                                        height: getLineHeight(
                                            lineHeight: 22.4, fontSize: 14.sp)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            32.verticalSpace,
            CustomElevatedButton.withIcon(
              onPressed: () {
                // GoRouter.of(context).push("${Routes.signupPage.navigate}""${Routes.signinPage.navigate}");
              },
              text: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
