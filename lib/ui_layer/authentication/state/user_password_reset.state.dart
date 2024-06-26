// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boostfin/core/utility/validator_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserPasswordResetState extends Equatable {
  final GlobalKey<FormState> formKey;
  final TextEditingController? emailController;
  //
  const UserPasswordResetState({
    required this.formKey,
    this.emailController,
  });

  @override
  List<Object?> get props => [formKey, emailController];

  String? validateEmailFormInput(String? stringValue) {
    if (!Validators.isEmail(stringValue ?? '')) {
      return 'Invalid email address';
    }
    return null;
  }

  UserPasswordResetState copyWith({
    GlobalKey<FormState>? formKey,
    TextEditingController? emailController,
  }) {
    return UserPasswordResetState(
      formKey: formKey ?? this.formKey,
      emailController: emailController ?? this.emailController,
    );
  }
}
