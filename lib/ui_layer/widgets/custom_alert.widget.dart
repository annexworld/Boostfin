import 'dart:ui';

import 'package:boostfin/theme/app_decoration.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.1, sigmaY: 2.1),
      child: Container(
        margin: EdgeInsets.only(top: 360.r),
        height: widget.height ?? 375.h,
        width: 350.w,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          border: Border.all(color: appTheme.neutral20),
          boxShadow: CustomBoxShadow.level2,
          borderRadius: BorderRadius.circular(24.r),
          color: appTheme.white,
        ),
        child: widget.child,
      ),
    );
  }
}
