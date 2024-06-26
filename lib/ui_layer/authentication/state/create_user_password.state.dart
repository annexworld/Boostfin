// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:boostfin/core/utility/validator_functions.dart';

class CreateUserPasswordState extends Equatable {
  final bool? isValidPassword;
  final bool? hasOneLowerCaseString;
  final bool? hasOneUpperCaseString;
  final bool? hasOneDigitCaseString;
  final bool? hasSpecialCharacter;
  final bool? isMinimumOfSix;
  final GlobalKey<FormState> formKey;
  final TextEditingController? passwordOldController;
  final TextEditingController? passwordNewController;
  //
  const CreateUserPasswordState({
    this.isValidPassword,
    this.hasOneLowerCaseString,
    this.hasOneUpperCaseString,
    this.hasOneDigitCaseString,
    this.hasSpecialCharacter,
    this.isMinimumOfSix,
    required this.formKey,
    this.passwordOldController,
    this.passwordNewController,
  });

  @override
  List<Object?> get props => [
        isValidPassword,
        hasOneLowerCaseString,
        hasOneUpperCaseString,
        hasOneDigitCaseString,
        isMinimumOfSix,
        formKey,
        passwordNewController,
        passwordOldController,
      ];

  String? validateEmailFormInput(String? stringValue) {
    if (!Validators.isEmail(stringValue ?? '')) {
      return 'Invalid email address';
    }
    return null;
  }

  CreateUserPasswordState copyWith({
    bool? isValidPassword,
    bool? hasOneLowerCaseString,
    bool? hasOneUpperCaseString,
    bool? hasOneDigitCaseString,
    bool? hasSpecialCharacter,
    bool? isMinimumOfSix,
    GlobalKey<FormState>? formKey,
    TextEditingController? passwordOldController,
    TextEditingController? passwordNewController,
  }) {
    return CreateUserPasswordState(
      isValidPassword: isValidPassword ?? this.isValidPassword,
      hasOneLowerCaseString:
          hasOneLowerCaseString ?? this.hasOneLowerCaseString,
      hasOneUpperCaseString:
          hasOneUpperCaseString ?? this.hasOneUpperCaseString,
      hasOneDigitCaseString:
          hasOneDigitCaseString ?? this.hasOneDigitCaseString,
      hasSpecialCharacter: hasSpecialCharacter ?? this.hasSpecialCharacter,
      isMinimumOfSix: isMinimumOfSix ?? this.isMinimumOfSix,
      formKey: formKey ?? this.formKey,
      passwordOldController:
          passwordOldController ?? this.passwordOldController,
      passwordNewController:
          passwordNewController ?? this.passwordNewController,
    );
  }
}
