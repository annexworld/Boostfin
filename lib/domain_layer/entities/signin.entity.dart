
class SigninResponse {
  SigninResponse({
    this.message,
    this.resource,
    this.code,
    this.status,
  });

  final String? message;
  final String? resource;
  final int? code;
  final bool? status;

  SigninResponse copyWith({
    String? message,
    String? resource,
    int? code,
    bool? status,
  }) {
    return SigninResponse(
      message: message ?? this.message,
      resource: resource ?? this.resource,
      code: code ?? this.code,
      status: status ?? this.status,
    );
  }
}
  
//   "message": "email format is not supported",
//   "code": 400,
//   "status": false,
//   "resource": "Authorization"
// }