import 'package:boostfin/core/custom_image_view.dart';
import 'package:boostfin/core/image_constant.dart';
import 'package:boostfin/core/widget_extension.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum TextFormType {
  text,
  email,
  password,
  phone,
  money,
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.inputFormatters,
    this.decoration,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.label,
    this.isRequired = false,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled,
    this.validator,
    this.maxLength,
    this.onChanged,
  })  : formType = TextFormType.text,
        super(
          key: key,
        );
  CustomTextFormField.password({
    Key? key,
    this.alignment,
    this.decoration,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.label,
    this.isRequired = false,
    this.autofocus = false,
    this.textStyle,
    this.textInputAction = TextInputAction.next,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled,
    this.validator,
    this.onChanged,
    this.maxLength,
  })  : textInputType = TextInputType.visiblePassword,
        obscureText = true,
        formType = TextFormType.password,
        inputFormatters = [],
        super(
          key: key,
        );
  CustomTextFormField.numberOnly({
    Key? key,
    this.alignment,
    this.decoration,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.label,
    this.isRequired = false,
    this.autofocus = false,
    this.textStyle,
    this.textInputAction = TextInputAction.next,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.obscureText,
    this.filled,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.inputFormatters,
  })  : textInputType = TextInputType.number,
        formType = TextFormType.phone,
        maxLength = 13,
        super(
          key: key,
        );
  CustomTextFormField.otp({
    Key? key,
    this.alignment,
    this.decoration,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.label,
    this.isRequired = false,
    this.autofocus = false,
    this.textStyle,
    this.textInputAction = TextInputAction.next,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.obscureText,
    this.filled,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.inputFormatters,
  })  : textInputType = TextInputType.number,
        formType = TextFormType.phone,
        super(
          key: key,
        );
  CustomTextFormField.emailAddress({
    Key? key,
    this.alignment,
    this.decoration,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.label,
    this.isRequired = false,
    this.autofocus = false,
    this.textStyle,
    this.textInputAction = TextInputAction.next,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.obscureText,
    this.filled,
    this.validator,
    this.onChanged,
    this.maxLength,
  })  : textInputType = TextInputType.emailAddress,
        formType = TextFormType.email,
        inputFormatters = [],
        super(
          key: key,
        );

  final TextFormType? formType;

  final bool? isRequired;

  final String? label;

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final InputDecoration? decoration;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final int? maxLength;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final Function(String? value)? onChanged;

  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
        maxLength: maxLength,
        scrollPadding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: controller,
        focusNode: focusNode,
        onTapOutside: (event) {
          if (focusNode != null) {
            focusNode?.unfocus();
          } else {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        inputFormatters: inputFormatters,
        decoration: decoration ?? _decoration,
        style: textStyle,
        obscureText: obscureText ?? false,
        obscuringCharacter: '•',
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        validator: validator,
        onChanged: onChanged,
      ),
    ).addFormLabel(label: label ?? '', isRequired: isRequired!);
  }

  InputDecoration get _decoration => InputDecoration(
        prefixIconConstraints: prefixConstraints,
        // suffixIconConstraints: suffixIconConstraints,
        hintText: hintText,
        icon: null,
        iconColor: null,
        label: null,
        labelText: null,
        labelStyle: null,
        floatingLabelStyle: null,
        helperText: null,
        helperStyle: null,
        helperMaxLines: null,
        hintStyle: null,
        hintTextDirection: null,
        hintMaxLines: null,
        hintFadeDuration: null,
        error: null,
        errorText: null,
        errorStyle: null,
        errorMaxLines: null,
        floatingLabelBehavior: null,
        floatingLabelAlignment: null,
        isCollapsed: null,
        isDense: null,
        contentPadding: null,
        prefixIcon: null,
        prefix: null,
        prefixText: null,
        prefixStyle: null,
        prefixIconColor: null,
        suffixIcon: formType == TextFormType.password
            ? SizedBox(
                child: CustomImageView(
                  fit: BoxFit.scaleDown,
                  imagePath: ImageConstant.svgHidePassword,
                ),
              )
            : suffix,
        suffix: null,
        suffixText: null,
        suffixStyle: null,
        suffixIconColor: appTheme.neutral40,
        suffixIconConstraints: null,
        counter: null,
        counterText: null,
        counterStyle: null,
        filled: null,
        fillColor: null,
        focusColor: null,
        hoverColor: null,
        errorBorder: null,
        focusedBorder: null,
        focusedErrorBorder: null,
        disabledBorder: null,
        enabledBorder: null,
        border: null,
        semanticCounterText: null,
        alignLabelWithHint: null,
      );
}
