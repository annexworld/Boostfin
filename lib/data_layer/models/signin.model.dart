// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:boostfin/domain_layer/domain_layer.export.dart';

class SigninResponseModel extends SigninResponse {
  SigninResponseModel({
    super.message,
    super.resource,
    super.code,
    super.status,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'resource': resource,
      'code': code,
      'status': status,
    };
  }

  factory SigninResponseModel.fromJson(Map<String, dynamic> json) {
    return SigninResponseModel(
      message: json['message'] != null ? json['message'] as String : null,
      resource: json['resource'] != null ? json['resource'] as String : null,
      code: json['code'] != null ? json['code'] as int : null,
      status: json['status'] != null ? json['status'] as bool : null,
    );
  }
}
