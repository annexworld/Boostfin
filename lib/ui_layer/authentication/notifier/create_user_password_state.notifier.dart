import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:boostfin/ui_layer/authentication/state/create_user_password.state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_user_password_state.notifier.g.dart';

@riverpod
class CreateUserPasswordStateNotifier
    extends _$CreateUserPasswordStateNotifier {
  @override
  CreateUserPasswordState build() {
    return CreateUserPasswordState(
      formKey: GlobalKey<FormState>(),
      passwordNewController: TextEditingController(),
      passwordOldController: TextEditingController(),
      hasOneDigitCaseString: false,
      hasOneLowerCaseString: false,
      hasOneUpperCaseString: false,
      isMinimumOfSix: false,
      isValidPassword: false,
    );
  }

  passwordValid(String? val) {
    // state = state.copyWith(
    // isValidPassword: (_validateUpperCase(val) &&
    //     _validateLowerCase(val) &&
    //     _validateDigits(val) &&
    //     _validateSpecialCharacter(val) &&
    //     _validateStringlength(val)));
    "${(_validateUpperCase(val) && _validateLowerCase(val) && _validateDigits(val) && _validateSpecialCharacter(val) && _validateStringlength(val))}"
        .debugString;
  }

  _validateSpecialCharacter(String? val) {
    val?.debugString;
    RegExp reg = RegExp(r'[@$!%*?&]');
    "${reg.hasMatch(val ?? '')}".debugString;
    state = state.copyWith(hasSpecialCharacter: reg.hasMatch(val ?? ''));
  }

  _validateUpperCase(String? val) {
    val?.debugString;
    RegExp reg = RegExp(r'[A-Z]');
    "${reg.hasMatch(val ?? '')}".debugString;
    state = state.copyWith(hasOneUpperCaseString: reg.hasMatch(val ?? ''));
  }

  _validateLowerCase(String? val) {
    val?.debugString;
    RegExp reg = RegExp(r'[a-z]');
    "${reg.hasMatch(val ?? '')}".debugString;
    state = state.copyWith(hasOneLowerCaseString: reg.hasMatch(val ?? ''));
  }

  _validateDigits(String? val) {
    val?.debugString;
    RegExp reg = RegExp(r'\d');
    "${reg.hasMatch(val ?? '')}".debugString;
    state = state.copyWith(hasOneDigitCaseString: reg.hasMatch(val ?? ''));
  }

  _validateStringlength(String? val) {
    state =
        state.copyWith(isMinimumOfSix: val != null ? val.length >= 6 : null);
  }
}
