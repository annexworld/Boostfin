import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/service_locator.dart';
import 'package:boostfin/ui_layer/onboarding/state/user_signup.state.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain_layer/domain_layer.export.dart';

part 'signup_state_one.notifier.g.dart';

@riverpod
class UserSignupStateNotifier extends _$UserSignupStateNotifier {
  // late BuildContext _context;

  @override
  UserSignupState build() {
    // _context = context;
    return UserSignupState(
        formKey: GlobalKey<FormState>(),
        emailController: TextEditingController(),
        phoneNoController: TextEditingController(),
        verificationType: SignupVerificationType.email,
        textInputFormatter: MaskTextInputFormatter(
            mask: '### #### ####',
            filter: {"#": RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy),
        loadingState: false);
  }

  bool validateSignupForm(BuildContext context) {
    if (state.formKey.currentState!.validate()) {
      state.formKey.currentState!.save();
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.focusedChild?.unfocus();
      }
      state.emailController!.text.debugString;
      state.phoneNoController!.text.debugString;
      return true;
    }
    return false;
  }

  set setVerificationMethod(SignupVerificationType type) =>
      state = state.copyWith(verificationType: type);

  verifyAccount(String email, String phone,
      {required BuildContext context}) async {
    if (state.verificationType != null) {
      state.emailController!.text.debugString;
      state.phoneNoController!.text.debugString;

      var payload = {
        "otpType": state.verificationType!.type,
        "email": email,
        "phoneNumber": phone,
      };
      "$payload".debugString;
      state = state.copyWith(loadingState: !state.loadingState);

      final result = await getit<SignupStageOneUsecase>().call(payload);

      state = state.copyWith(loadingState: !state.loadingState);

      result.fold((err) {
// todo: adde error snackbar
      }, (resp) {
        navigatorKey.currentState!.context.pop();
        GoRouter.of(context).push("${Routes.signupPage.navigate}"
            "${Routes.verifyAccountPage.navigate}");
      });
    }
  }
}
