import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this);

    controller.addListener(() {
      "animation state: ${controller.status}".debugString;
      if (controller.isCompleted) {
        Future.delayed(3.seconds,
            () => GoRouter.of(context).go(Routes.splashScreenPage1.navigate));
      }
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48.95.w,
              height: 48.95.h,
              margin: EdgeInsets.only(right: 12.r),
              child: CustomImageView(
                imagePath: ImageConstant.imgLogo,
              ),
            ).animate().scaleXY(
                duration: 200.milliseconds,
                begin: 0,
                end: 1,
                curve: Curves.easeInOut),
            Text(
              'BoostFin',
              style: CustomTextStyles.h4Grotesk_32x6.copyWith(),
            ).animate(delay: 1000.microseconds, controller: controller).slideX(
                duration: 1.seconds,
                begin: 10,
                end: 0,
                curve: Curves.fastOutSlowIn)
            // .fadeIn(duration: 800.milliseconds, curve: Curves.easeInOut)
          ],
        ),
      ),
    );
  }
}
