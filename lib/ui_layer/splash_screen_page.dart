import 'package:boostfin/core/widget_extension.dart';
import 'package:boostfin/theme/custom_text_style.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomTextFormField(
            hintText: 'Enter your email',
            label: 'Email',
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
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
    this.onChanged,
  }) : super(
          key: key,
        );

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
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
        decoration: decoration ?? _decoration,
        style: textStyle,
        obscureText: obscureText!,
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
        suffixIcon: null,
        suffix: null,
        suffixText: null,
        suffixStyle: null,
        suffixIconColor: null,
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
