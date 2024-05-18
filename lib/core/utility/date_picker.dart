import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:boostfin/core/date_time_utils.dart';
import 'package:flutter/material.dart';

Future<String?> getDate(BuildContext context,
    {bool? limitSelection = false,
    bool Function(DateTime)? selectableDayPredicate}) async {
  late DateTime? _picked;
  if (Platform.isIOS) {
    // _picked = await CupertinoDatePicker(
    //   onDateTimeChanged: (value) {},
    // );
  } else {
    _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      selectableDayPredicate: selectableDayPredicate ??= limitSelection!
          ? (dateTime) {
              if (dateTime.isAfter(DateTime.now())) {
                return false;
              } else {
                return true;
              }
            }
          : null,
    );
  }
  if (_picked != null) return _picked.convertToQueryDate;
  return null;
}
