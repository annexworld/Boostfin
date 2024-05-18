import 'package:dio/dio.dart';


class RefreshTokenInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // var api = getit<ApiService>();
    // var db = getit<HiveAuthService>();
    // if (options.path.contains('/auth')) {
    //   return handler.next(options);
    // }
    // try {
    //   Authentication? _auth = db.getAuthenticationObj();

    //   DateTime expiry =
    //       DateTime.fromMillisecondsSinceEpoch(_auth!.jwtExpiryDateTime! * 1000);

    //   '${_auth.jwtExpiryDateTime} Expiry Date Time in UTC: ${expiry.convertToAppDate}'
    //       .debugString;
    //   //
    //   if (DateTime.now().isBefore(expiry) == false) {
    //     // set header
    //     'Options: ${options.headers}'.debugString;

    //     options.headers["Authorization"] = "Bearer ${_auth.refreshToken}";
    //     var res = await api(Options(headers: options.headers));

    //     if (res.getResponseStatus) {
    //       String accessToken = res.data["data"]["accessToken"];
    //       String refreshToken = res.data["data"]["refreshToken"];

    //       db.saveAuthorizationObject(_auth.copyWith(
    //           accessToken: accessToken, refreshToken: refreshToken));
    //       // set new accessToken
    //       options.headers["Authorization"] = "Bearer $accessToken";

    //       return handler.next(options);
    //     }
    //   }

    //   return handler.next(options);
    // } catch (_) {
    //   db.deleteAuthorizationObject();
    //   navigatorKey.currentContext!.go(AppRoute.signInScreen.navigate);
    //   return handler.resolve(
    //     Response(
    //       requestOptions: options,
    //       data: ErrorParser.fromJson({
    //         "status": "401",
    //         "message": "User unauthorized",
    //         "data": {"status": 401, 'error': "User is unauthorized"},
    //       }),
    //       statusCode: 401,
    //     ),
    //   );
    // }
  }
}
