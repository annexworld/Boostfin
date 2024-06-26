final class Validators {
  /// This is here to for the 'DRY'
  static bool? _isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty as bool?;
    }
    return false;
  }

  static bool _hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool _isNull(dynamic value) => value == null;

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool? _isNullOrBlank(dynamic value) {
    if (_isNull(value)) {
      return true;
    }

    // Pretty sure that isNullOrBlank should't be validating
    // iterables... but I'm going to keep this for compatibility.
    return _isEmpty(value);
  }

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool? _isBlank(dynamic value) {
    return _isEmpty(value);
  }

  /// Checks if string consist only numeric.
  /// Numeric only doesn't accepting "." which double data type have
  static bool isNumericOnly(String s) => _hasMatch(s, r'^\d+$');

  /// Checks if string consist only Alphabet. (No Whitespace)
  static bool isAlphabetOnly(String s) => _hasMatch(s, r'^[a-zA-Z]+$');

  /// Checks if string contains at least one Capital Letter
  static bool hasCapitalletter(String s) => _hasMatch(s, r'[A-Z]');

  /// Checks if string is email.
  static bool isEmail(String s) => _hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if string is phone number.
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return _hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Password should have,
  /// at least a upper case letter
  ///  at least a lower case letter
  ///  at least a digit
  ///  at least a special character [@#$%^&+=]
  ///  length of at least 4
  /// no white space allowed
  bool isValidPassword(
    String? inputString, {
    bool isRequired = false,
  }) {
    bool isInputStringValid = false;

    if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
      isInputStringValid = true;
    }

    if (inputString != null && inputString.isNotEmpty) {
      const pattern =
          r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$';

      final regExp = RegExp(pattern);

      isInputStringValid = regExp.hasMatch(inputString);
    }

    return isInputStringValid;
  }

  /// Checks if string is phone number is valid number
  bool isValidPhone(
    String? inputString, {
    bool isRequired = false,
  }) {
    bool isInputStringValid = false;

    if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
      isInputStringValid = true;
    }

    if (inputString != null && inputString.isNotEmpty) {
      if (inputString.length > 14 || inputString.length < 11) return false;

      const pattern = r'^[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
      // const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

      final regExp = RegExp(pattern);

      isInputStringValid = regExp.hasMatch(inputString);
    }

    return isInputStringValid;
  }

  /// Capitalize each word inside string
  /// Example: your name => Your Name, your name => Your name
  static String? capitalize(String value) {
    if (_isNull(value)) return null;
    if (_isBlank(value)!) return value;
    return value.split(' ').map(capitalizeFirst).join(' ');
  }

  /// Uppercase first letter inside string and let the others lowercase
  /// Example: your name => Your name
  static String? capitalizeFirst(String s) {
    if (_isNull(s)) return null;
    if (_isBlank(s)!) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  /// Extract numeric value of string
  /// Example: OTP 12312 27/04/2020 => 1231227042020ß
  /// If firstword only is true, then the example return is "12312"
  /// (first found numeric word)
  static String numericOnly(String s, {bool firstWordOnly = false}) {
    var numericOnlyStr = '';

    for (var i = 0; i < s.length; i++) {
      if (isNumericOnly(s[i])) {
        numericOnlyStr += s[i];
      }
      if (firstWordOnly && numericOnlyStr.isNotEmpty && s[i] == " ") {
        break;
      }
    }

    return numericOnlyStr;
  }
}
