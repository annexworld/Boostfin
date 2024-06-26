// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SplashScreenState extends Equatable {
  final int? currentPage;
  final List<OnboardingContent>? onboardingContent;
  const SplashScreenState({
    this.currentPage,
    this.onboardingContent,
  });
  @override
  List<Object?> get props => [onboardingContent, currentPage];

  SplashScreenState copyWith({
    int? currentPage,
    List<OnboardingContent>? onboardingContent,
  }) {
    return SplashScreenState(
      currentPage: currentPage ?? this.currentPage,
      onboardingContent: onboardingContent ?? this.onboardingContent,
    );
  }
}

class OnboardingContent {
  final String title;
  final String caption;
  final bool isActive;
  OnboardingContent({
    required this.title,
    required this.caption,
    required this.isActive,
  });
}
