import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        3.seconds, () => GoRouter.of(context).go(Routes.splashScreenPage1.navigate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primary,
      body: Center(
        child: CustomImageView(imagePath: ImageConstant.imgLogo),
      ),
    );
  }
}
