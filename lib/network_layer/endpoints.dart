class Endpoints {
  // Authentications
  static const String _authentication = '/auth';
  static const String _misc = '/misc';

  static const String loginUser = '$_authentication/login';
  static const String onboardingStateOne = '$_authentication/onboard/stage-one';
  static const String onboardingStateTwo = '$_authentication/onboard/stage-two';
  static const String onboardingStateThree =
      '$_authentication/onboard/stage-three';
  static const String completedStateOne =
      '$_authentication/onboard/complete-stage-one';
  static const String forgotPassword = '$_authentication/forgot-password';
  static const String resetPassword = '$_authentication/reset-password';

  /// queryParameters: recipient email/phone no.
  static const String requestOTP = '$_misc/otp/get';

  /// pathParameter: otp refference
  static String resendOTP(String ref) => '$_misc/otp/resend/$ref';
  static const String settings = '$_misc/settings';
}
