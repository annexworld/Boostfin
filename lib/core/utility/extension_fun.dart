import 'package:intl/intl.dart';
import 'package:boostfin/core/utility/validator_functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

extension DioResponseExtension on Response? {
  bool get getResponseStatus {
    final Response? response = this;
    if ((response != null) || (response?.statusCode != null)) {
      if (response!.statusCode! >= 200 && response.statusCode! <= 300) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}

extension PrintStringExtension on String {
  get debugString {
    debugPrint(":::::: $this ::::::", wrapWidth: 2048);
  }
}

extension PhoneNumberExtension on String {
  String get removeFirstZero {
    return this.replaceFirst(RegExp(r'^0'), '');
  }
}

extension NairaFormatter on double {
  String get nairaFormat {
    NumberFormat formatter = NumberFormat.currency(symbol: "₦");
    // Format the double value to a currency string
    String formattedValue = formatter.format(this);
    return formattedValue;
  }
}

extension MaskEmailText on String {
  String get maskEmail {
    int nameLength = this.indexOf('@');
    if (nameLength <= 2) {
      // If the username is too short to mask meaningfully, return the original email
      return this;
    }
    String username = this.substring(0, nameLength);
    String maskedUsername = username[0] +
        '*' * (username.length - 2) +
        username[username.length - 1];
    return maskedUsername + this.substring(nameLength);
  }
}

extension StringExtensions on String {
  static bool isNull(dynamic value) => value == null;

  String? get capitalize => Validators.capitalize(this);

  String? get capitalizeFirst => Validators.capitalizeFirst(this);
}
