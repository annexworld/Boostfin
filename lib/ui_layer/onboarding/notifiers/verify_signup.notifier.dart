import 'package:boostfin/ui_layer/onboarding/state/verifiy_signup.state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_signup.notifier.g.dart';

@riverpod
class VerityUserSignupStageOneNotifier
    extends _$VerityUserSignupStageOneNotifier {
  @override
  VerityUserSignupStageOne build() {
    return VerityUserSignupStageOne(verifyOtp: TextEditingController());
  }
}
