import 'package:flutter/material.dart';
import 'package:boostfin/theme/app_decoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.decoration,
      this.height,
      this.width,
      this.padding,
      this.margin,
      required this.child});
  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: decoration,
      child: child,
    );
  }
}
