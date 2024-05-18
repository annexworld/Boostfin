import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:boostfin/ui_layer/widgets/custom_buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class CustomElevatedButton extends BaseButton {
  CustomElevatedButton(
      {super.key,
      this.isloading,
      this.textColor,
      EdgeInsets? margin,
      VoidCallback? onPressed,
      ButtonStyle? buttonStyle,
      Alignment? alignment,
      TextStyle? buttonTextStyle,
      bool? isDisabled,
      double? height,
      double? width,
      required String text})
      : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  late bool? isloading;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: isDisabled ?? false ? null : onPressed,
        style: buttonStyle,
        child: isloading ?? false
            ? Transform.scale(
                scale: 0.4.r,
                child: CircularProgressIndicator(
                  color: appTheme.neutral90,
                ),
              )
            : Text(
                text,
                style: buttonTextStyle ??
                    CustomTextStyles.buttonLargeText.copyWith(
                        color: isDisabled ?? false
                            ? appTheme.neutral30
                            : textColor ?? appTheme.white),
              ),
      ),
    );
  }
}
