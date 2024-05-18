class Endpoints {
  // Authentications
  static const String _authentication = '/auth';
  static const String _user = '/user';
  static const String _profile = '/profile';
  static const String _farm = '/farm';
  static const String _pond = '/pond';
  static const String _production = '/production-cycles';
  static const String _cycle = '/cycle-activity';
  static const String _medication = '/medication-type';
  static const String _orders = '/order';
  static const String _inventory = '/inventory';
  static const String _sales = '/sales';

  /// Fingerlings Sales
  static const String sellFingerlings = _sales;

  /// Order
  static const String createOrder = _orders;
  static const String getOrders = _orders;
  static const String getInventoryItems = _inventory;
  static String getInventoryItemsByCategory(String query) =>
      "$_inventory/category/$query";

  /// POST:
  static const String login = '$_authentication/login';

  /// GET: has :otp as path params
  static String verifyUserOtp(String otp) =>
      '$_authentication/confirm-otp/$otp';

  /// PUT:
  static const String confirmUser = '$_authentication/confirm-user';

  /// PUT:
  static const String changeUserPassword = '$_authentication/change-password';
  static const String resendAccountVerificationToken =
      '$_authentication/resend-verify-otp';
  static const String refreshToken = '$_authentication/refresh-token';
  static const String forgotPassword = '$_authentication/forgot-password';
  static const String resetPassword = '$_authentication/reset-password';

  /// DELETE: Delete User Account
  static String deleteAccount(String id) => '$_user/$id/account';
  // Ponds
  static const String pondType = '/pond-type';
  static const String createPond = _pond;
  static String updatePond(String id) => '$_pond/$id';
  //
  static String getPondCycleHistory(String cycle) =>
      '$_production/$cycle/cycles';
  //
  static String getCycleActivities(String id) => '$_cycle/$id/';
  static const String addFishActivity = '$_cycle/fish-activity';
  static const String addPondActivity = '$_cycle/pond-activity';
  //
  static const String getMyPond = '$_pond/my-ponds';
  //
  static String startProdCycle(String id) => '$_production/$id/start';
  static String endProdCycle(String id) => '$_production/$id/end-cycle';
  //
  static String getActiveProdCycles(String pondCode) =>
      '$_production/$pondCode/active-cycle';

  // User Profile
  static const String getUserProfile = _profile;

  /// PUT:
  static const String updateProfile = '$_profile/personal-info';

  /// FORM-DATA:
  static const String updateProfileImage = '$_profile/profile-image';
  // User Bank Details
  static const String getUserBankDetails = '';

  // Farms enpoint
  static const String createFarm = '$_farm';
  static String updateFarm(String farmCode) => '$_farm/$farmCode';
  static String myPonds(String farmCode) => '$_farm/$farmCode/ponds';
  static const String myFarms = '$_user/my-farms';

// Fish medication
  static const String getMedicationType = _medication;
  static const String fishType = '/fish-type';
  static const String fishSize = '/fish-size';
  static const String feedType = '/feed-type';
  static const String feedBrand = '/feed-brand';

  // Country State City Utility
  static const String getCountries = '/countries';
  static const String getStates = '/states';
  static String getCities(String ciso, String siso) =>
      '/countries/$ciso/states/$siso/cities';
}
