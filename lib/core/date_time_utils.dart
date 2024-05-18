import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormatPattern = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  String get convertToQueryDate => DateFormat('yyyy-MM-dd').format(this);

  String get convertToAppDate => DateFormat('MMMM d, y', 'en_US').format(this);

  String get getTimeElapsed {
    final now = DateTime.now();
    final difference = now.difference(this);

    // if (difference.inSeconds < 60) {
    //   return 'A min ago';
    // } else if (difference.inMinutes < 60) {
    //   return '${difference.inMinutes} mins ago';
    // } else if (difference.inHours < 24) {
    //   return '${difference.inHours} hours ago';
    // } else if (difference.inHours < 48) {
    //   return 'yesterday';
    // } else if (difference.inHours < 72) {
    //   return '2 days ago';
    // } else {
    //   return DateFormat('MMMM d, y', 'en_US').format(this);
    // }

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'a minute ago';
        }
        return '${difference.inMinutes} minutes ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return 'yesterday';
    } else if (difference.inDays == 2) {
      return '2 days ago';
    } else {
      return convertToAppDate;
    }
  }

  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = dateTimeFormatPattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

extension TimeExtension on DateTime {
  /// Extract the hour (1-24 format) from the DateTime object.
  int get hour => this.hour;

  /// Extract the minute (0-59) from the DateTime object.
  int get minute => this.minute;

  /// Extract the second (0-59) from the DateTime object.
  int get second => this.second;

  /// Extract the hour (1-12 format) from the DateTime object.
  int get hour12 => this.hour % 12 != 0 ? hour % 12 : 12;

  /// Check if it's AM (true) or PM (false).
  bool get isAm => this.hour < 12;

  // String get minuteTimeline {
  //   String time;

  //   if (minute >= 60 || <= 120)
  //     return time = 'a minute ago';
  //   else if (minute <= 10)
  //     return time = 'a minute ago';
  //   else if (minute <= 20)
  //     return time = 'a minute ago';
  //   else if (minute <= 30)
  //     return time = 'a minute ago';
  //   else if (minute <= 40)
  //     return time = 'a minute ago';
  //   else if (minute <= 50)
  //     return time = '50 minute ago';
  //   else if (hour <= 24)
  //     return time = 'a minute ago';
  //   else {
  //     time = format12Hour;
  //   }
  //   return time;
  // }

  /// Get a formatted string representing time in 12-hour format (e.g., "10:30 AM").
  String get format12Hour =>
      '${hour12.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ${isAm ? 'AM' : 'PM'}';
}
