import 'package:boostfin/ui_layer/authentication/state/user_password_reset.state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_password_reset_state.notifier.g.dart';

@riverpod
class UserPasswordResetStateNotifier extends _$UserPasswordResetStateNotifier {
  @override
  UserPasswordResetState build() {
    return UserPasswordResetState(
      formKey: GlobalKey<FormState>(),
      emailController: TextEditingController(),
    );
  }
}
