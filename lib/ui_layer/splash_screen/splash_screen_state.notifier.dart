import 'package:boostfin/ui_layer/splash_screen/state/splash_screen.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_screen_state.notifier.g.dart';

@riverpod
class SplashScreenStateNotifier extends _$SplashScreenStateNotifier {
  @override
  SplashScreenState build() {
    return SplashScreenState(currentPage: 0, onboardingContent: [
      OnboardingContent(
          title: "Fuel your growth with BoostFin!",
          caption:
              "Apply for flexible loans and get funds fast. Let's boost your business together!",
          isActive: true),
      OnboardingContent(
          title: "Flexible repayment options",
          caption: "Repayment of fees with tenors between 3 to 96 weeks",
          isActive: false),
      OnboardingContent(
          title: "Where business dreams take flight",
          caption: "Apply, customize, grow. Elevate your business today!",
          isActive: false),
    ]);
  }
}
