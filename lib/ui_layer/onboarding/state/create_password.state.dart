// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CreatePasswordState extends Equatable {
  final GlobalKey<FormState> formState;
  final TextEditingController? passwordCtrl;
  final TextEditingController? confirmPasswordCtrl;
  final bool? formIsValid;
  CreatePasswordState({
    required this.formState,
    this.passwordCtrl,
    this.confirmPasswordCtrl,
    this.formIsValid,
  });

  @override
  List<Object?> get props => [
        formState,
        passwordCtrl,
        confirmPasswordCtrl,
        formIsValid,
      ];

  CreatePasswordState copyWith({
    GlobalKey<FormState>? formState,
    TextEditingController? passwordCtrl,
    TextEditingController? confirmPasswordCtrl,
    bool? formIsValid,
  }) {
    return CreatePasswordState(
      formState: formState ?? this.formState,
      passwordCtrl: passwordCtrl ?? this.passwordCtrl,
      confirmPasswordCtrl: confirmPasswordCtrl ?? this.confirmPasswordCtrl,
      formIsValid: formIsValid ?? this.formIsValid,
    );
  }
}
