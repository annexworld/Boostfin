// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class VerityUserSignupStageOne extends Equatable {
  final TextEditingController? verifyOtp;
  const VerityUserSignupStageOne({
    this.verifyOtp,
  });
  @override
  List<Object?> get props => [verifyOtp];

  VerityUserSignupStageOne copyWith({
    TextEditingController? verifyOtp,
  }) {
    return VerityUserSignupStageOne(
      verifyOtp: verifyOtp ?? this.verifyOtp,
    );
  }
}
