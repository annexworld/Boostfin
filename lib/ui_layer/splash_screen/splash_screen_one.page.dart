import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/splash_screen/splash_screen_state.notifier.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/custom_elevated_btn.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage1 extends ConsumerWidget {
  const SplashScreenPage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateRef = ref.watch(splashScreenStateNotifierProvider);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            42.verticalSpace,
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go(Routes.signupPage.navigate);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Skip',
                    style: CustomTextStyles.bodySmallGrotesk_14x5.copyWith(
                        height: getLineHeight(lineHeight: 19.6, fontSize: 14),
                        color: appTheme.primary,
                        letterSpacing: -.5.sp),
                  ),
                  6.horizontalSpace,
                  CustomImageView(
                    imagePath: ImageConstant.svgLeftArrowIcon,
                    color: appTheme.primary,
                    width: 16.r,
                    height: 16.r,
                  )
                ],
              ),
            ),
            17.verticalSpace,
            SizedBox(
              height: 340.h,
              width: 350.w,
              child: CustomImageView(
                imagePath: ImageConstant.imgOnboarding,
              ),
            ),
            14.verticalSpace,
            SizedBox(
                // height: 154.h,rr
                width: 350.w,
                child:
                    // PageView.builder(
                    //   controller: PageController(),
                    //   onPageChanged: (v) {},
                    //   itemCount: stateRef.onboardingContent?.length ?? 0,
                    //   itemBuilder: (BuildContext context, index) =>

                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 330.w,
                      padding: EdgeInsets.symmetric(horizontal: 24.0.r),
                      child: Text(
                        'Fuel your growth with BoostFin!',
                        style: CustomTextStyles.h5Grotesk_24x6.copyWith(
                          fontWeight: FontWeight.w500,
                          color: appTheme.neutral100,
                          height: getLineHeight(lineHeight: 28.8, fontSize: 24),
                          letterSpacing: -.25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    8.verticalSpace,
                    Container(
                      width: 330.w,
                      padding: EdgeInsets.symmetric(horizontal: 28.0.r),
                      child: Text(
                        'Apply for flexible loans and get funds fast. Let\'s boost your business together!',
                        style: CustomTextStyles.bodyLargeGrotesk_16x4.copyWith(
                          fontWeight: FontWeight.w500,
                          color: appTheme.neutral60,
                          height: getLineHeight(lineHeight: 25.6, fontSize: 16),
                          letterSpacing: -.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    12.verticalSpace,
                    Container(
                      margin: EdgeInsets.only(top: 20.r, bottom: 48.r),
                      height: 4.h,
                      color: appTheme.neutral20,
                    )
                  ],
                )),
            CustomElevatedButton.withIcon(
              text: 'Get started',
              onPressed: () {
                GoRouter.of(context).go(Routes.signupPage.navigate);
              },
              icon: ImageConstant.svgLeftArrowIcon,
              width: 260.w,
            ),
            16.verticalSpace,
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(Routes.signinPage.navigate);
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'Already have an account?'),
                    TextSpan(
                      text: ' Log In',
                      style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                        color: appTheme.primary,
                        height: getLineHeight(lineHeight: 22.4, fontSize: 14),
                      ),
                    ),
                  ],
                  style: CustomTextStyles.bodySmallGrotesk_14x4.copyWith(
                    color: appTheme.neutral60,
                    height: getLineHeight(lineHeight: 22.4, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
