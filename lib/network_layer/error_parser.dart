import 'dart:convert';

/// Default implementation of [Exception] which carries a message.
class ProviderException implements Exception {
  final dynamic message;

  ProviderException([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "An error occured";
    return "$message";
  }
}

class ErrorParser {
  final String? status;
  final String? message;
  final ErrorData? error;

  ErrorParser({
    this.status,
    this.message,
    this.error,
  });

  factory ErrorParser.fromRawJson(String str) =>
      ErrorParser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorParser.fromJson(Map<String, dynamic> json) => ErrorParser(
        status: json["status"],
        message: json["message"],
        error: json["data"] != Map
            ? null
            : json["data"] == null
                ? null
                : ErrorData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": error?.toJson(),
      };
}

class ErrorData {
  final int? status;
  final String? error;

  ErrorData({
    this.status,
    this.error,
  });

  factory ErrorData.fromRawJson(String str) =>
      ErrorData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        status: json["status"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
      };
}
