import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/core/utility/constants/constant_padding.utils.dart';
import 'package:boostfin/theme/app_decoration.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/dashboard/widgets/home_page_appbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardHomePage extends ConsumerWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: HomePageAppBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            height: 237.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16.r),
              ),
              color: appTheme.primary,
            ),
          ),
          Positioned(
            top: 120.h,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              padding: pagePadding,
              // constraints: const BoxConstraints.expand(),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 160.h,
                    decoration: AppDecoration.fillWhite.copyWith(
                      border: Border.all(color: appTheme.neutral20),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            AssetImage('assets/images/dashboard_pattern.png'),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 18.r, horizontal: 24.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Account',
                              style: CustomTextStyles.bodySmallGrotesk_14x4
                                  .copyWith(
                                      color: appTheme.neutral100,
                                      height: getLineHeight(
                                          lineHeight: 0, fontSize: 14),
                                      letterSpacing: .5.sp),
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '0083391706',
                                    style: CustomTextStyles
                                        .bodyLargeGrotesk_16x4
                                        .copyWith(
                                      color: appTheme.neutral100,
                                      height: getLineHeight(
                                          lineHeight: 0, fontSize: 16),
                                      letterSpacing: -.5.sp,
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  SizedBox(
                                    height: 16.h,
                                    width: 16.w,
                                    child: CustomImageView(
                                      imagePath:
                                          ImageConstant.svgDropdownCaretIcon,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  )
                                ]),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '₦358,500.00',
                                  style: CustomTextStyles.h4Grotesk_32x7
                                      .copyWith(
                                          color: appTheme.neutral100,
                                          height: getLineHeight(
                                              lineHeight: 38.4, fontSize: 32),
                                          letterSpacing: -.5.sp),
                                ),
                                Text(
                                  'Account balance',
                                  style: CustomTextStyles.bodySmallGrotesk_14x4
                                      .copyWith(
                                          color: appTheme.neutral100,
                                          height: getLineHeight(
                                              lineHeight: 0, fontSize: 14),
                                          letterSpacing: .5.sp),
                                ),
                              ],
                            ),
                            Container(
                              height: 24.h,
                              width: 24.w,
                              margin: EdgeInsets.only(top: 8.r),
                              child: CustomImageView(
                                imagePath: ImageConstant.svgHidePasswordFilled,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
