import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
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
                ],
              ),
            ),
            32.verticalSpace,
            CustomElevatedButton.withIcon(
              onPressed: () {},
              text: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
