import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:boostfin/core/utility/type_definitions.dart';
import 'package:boostfin/network_layer/error_parser.dart';
import 'package:boostfin/service_locator.dart';
import 'package:boostfin/ui_layer/authentication/state/signin.state.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain_layer/domain_layer.export.dart';

part 'signin_state.notifier.g.dart';

@riverpod
class SigninStateNotifier extends _$SigninStateNotifier {
  @override
  SigninStateHandler build() {
    return SigninStateHandler(
      formKey: GlobalKey<FormState>(),
      phoneControlller: TextEditingController(),
      passwordController: TextEditingController(),
      textInputFormatter: MaskTextInputFormatter(
          mask: '### #### ####',
          filter: {"#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.lazy),
      isloading: false,
    );
  }

  Future<void> validateCredentials(BuildContext context) async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }

    if (state.formKey.currentState!.validate()) {
      // create a copy of the current state to set a new state
      state = state.copyWith(isloading: !state.isloading);

      final RequestPayload payload = {
        "email": state.phoneControlller.text,
        "password": state.passwordController.text,
      };

      final response = await getit<SigninUsecase>().call(payload);
      state = state.copyWith(isloading: !state.isloading);

      response.fold((ErrorParser? error) {
        // throw error to ui
      }, (SigninResponse result) {
        // navigate user to dashboard
        result.message!.debugString;
        state.navigateToDashboard(context);
      });
    }
  }
}
