// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:boostfin/core/utility/validator_functions.dart';

enum SignupVerificationType {
  email(0),
  phone(1);

  const SignupVerificationType(this.type);
  final int type;
}

class UserSignupState extends Equatable {
  final TextEditingController? emailController;
  final TextEditingController? phoneNoController;
  final MaskTextInputFormatter? textInputFormatter;
  final GlobalKey<FormState> formKey;
  final bool loadingState;
  final SignupVerificationType? verificationType;

  const UserSignupState({
    this.emailController,
    this.phoneNoController,
    this.textInputFormatter,
    required this.formKey,
    required this.loadingState,
    this.verificationType,
  });

  String? validateEmailFormInput(String? stringValue) {
    if (!Validators.isEmail(stringValue ?? '')) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validatePhoneNoFormInput(String? stringValue) {
    if (textInputFormatter!.getUnmaskedText().length <= 10) {
      return 'Invalid phone number';
    }
    if (!Validators.isPhoneNumber(stringValue ?? '')) {
      return 'Invalid phone number';
    }

    return null;
  }

  @override
  List<Object?> get props => [
        emailController,
        phoneNoController,
        verificationType,
        formKey,
        loadingState,
        textInputFormatter
      ];

  UserSignupState copyWith({
    TextEditingController? emailController,
    TextEditingController? phoneNoController,
    MaskTextInputFormatter? textInputFormatter,
    GlobalKey<FormState>? formKey,
    bool? loadingState,
    SignupVerificationType? verificationType,
  }) {
    return UserSignupState(
      emailController: emailController ?? this.emailController,
      phoneNoController: phoneNoController ?? this.phoneNoController,
      textInputFormatter: textInputFormatter ?? this.textInputFormatter,
      formKey: formKey ?? this.formKey,
      loadingState: loadingState ?? this.loadingState,
      verificationType: verificationType ?? this.verificationType,
    );
  }
}
