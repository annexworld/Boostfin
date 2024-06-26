// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:boostfin/core/utility/validator_functions.dart';
import 'package:boostfin/routes.dart';

class SigninStateHandler extends Equatable {
  SigninStateHandler({
    required this.formKey,
    required this.phoneControlller,
    required this.passwordController,
    required this.textInputFormatter,
    required this.isloading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneControlller;
  final TextEditingController passwordController;
  final MaskTextInputFormatter textInputFormatter;
  final bool isloading;

  final Validators validatorFunc = Validators();

  String? phoneNumberValidator(String? val) {
    if (!validatorFunc.isValidPhone(val)) return "Invalid phone number";
    return null;
  }

  String? passwordValidator(String? val) {
    if (validatorFunc.isValidPassword(val)) return "Invalid input";
    return null;
  }

  void navigateToDashboard(BuildContext context) {
    GoRouter.of(context).go(Routes.homePage.navigate);
  }

  @override
  List<Object?> get props => [
        formKey,
        phoneControlller,
        textInputFormatter,
        passwordController,
        isloading
      ];

  SigninStateHandler copyWith({
    GlobalKey<FormState>? formKey,
    TextEditingController? phoneControlller,
    TextEditingController? passwordController,
    MaskTextInputFormatter? textInputFormatter,
    bool? isloading,
  }) {
    return SigninStateHandler(
      formKey: formKey ?? this.formKey,
      phoneControlller: phoneControlller ?? this.phoneControlller,
      passwordController: passwordController ?? this.passwordController,
      textInputFormatter: textInputFormatter ?? this.textInputFormatter,
      isloading: isloading ?? this.isloading,
    );
  }
}
