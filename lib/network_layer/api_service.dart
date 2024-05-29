import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:boostfin/network_layer/endpoints.dart';
import 'package:boostfin/network_layer/error_parser.dart';
import 'package:boostfin/network_layer/interceptors/refresh_token.dart';
import 'package:boostfin/network_layer/interceptors/request_authentication.dart';

class ApiService {
  ApiService(this._dio, {required this.baseUrl}) {
    _dio = this._dio ?? Dio();
  }

  late Dio? _dio;
  late String baseUrl;
  //

  final _defaultHeaders = {"Content-Type": "application/json"};

  /// dio initialization function
  void initBaseOptions() {
    final options = BaseOptions(
      baseUrl: baseUrl,
      headers: _defaultHeaders,
      connectTimeout: const Duration(seconds: 25),
      receiveTimeout: const Duration(seconds: 45),
      receiveDataWhenStatusError: true,
      followRedirects: false,
    );

    // dio request
    _dio!.options = options;
  }

  void initializeInterceptors() {
    debugPrint('initializeInterceptors()');

    _dio!.interceptors
        // ..add(RefreshTokenInterceptor())
        // ..add(RequestAuthentication())
        .add((PrettyDioLogger(
      requestHeader: kDebugMode,
      requestBody: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: false,
      error: kDebugMode,
      compact: kDebugMode,
      maxWidth: 90,
    )));
  }

//
  Response<ErrorParser?> errorHandler(DioException exp) {
    //
    "error-type: ${exp.type}".debugString;
    "error-error: ${exp.error}".debugString;
    "error-uri: ${exp.requestOptions.uri}".debugString;
    "error-statusCode: ${exp.response?.statusCode}".debugString;
    "error-response data: ${exp.response?.data}".debugString;

    if (exp.type == DioExceptionType.connectionError) {
      return Response<ErrorParser?>(
        requestOptions: exp.requestOptions,
        headers: exp.response?.headers ?? Headers(),
        data: ErrorParser.fromJson({
          "status": "400",
          "message": "Internet connenction faliure",
          "data": null,
        }),
        statusCode: exp.response?.statusCode ?? 400,
      );
    }
    if (exp.type == DioExceptionType.connectionTimeout) {
      return Response<ErrorParser?>(
        requestOptions: exp.requestOptions,
        headers: exp.response?.headers ?? Headers(),
        data: ErrorParser.fromJson({
          "status": "400",
          "message": "Network connection timeout",
          "data": null,
        }),
        statusCode: exp.response?.statusCode ?? 400,
      );
    }
    if (exp.response != null) {
      if (exp.response!.statusCode == 500) {
        return Response<ErrorParser?>(
          requestOptions: exp.requestOptions,
          headers: exp.response?.headers ?? Headers(),
          data: ErrorParser.fromJson(exp.response?.data ??
              {
                "status": "500",
                "message": "Internal server error",
                "data": null,
              }),
          statusCode: exp.response?.statusCode ?? 500,
        );
      }
      return Response<ErrorParser?>(
        requestOptions: exp.requestOptions,
        headers: exp.response?.headers ?? Headers(),
        data: ErrorParser.fromJson(exp.response!.data!),
        statusCode: exp.response?.statusCode,
      );
    }
    //
    return Response<ErrorParser?>(
      requestOptions: exp.requestOptions,
      headers: exp.response?.headers ?? Headers(),
      data: (exp.response == null ||
              exp.response?.data == null ||
              exp.response?.data != Map)
          ? null
          : ErrorParser.fromJson(exp.response!.data!),
      statusCode: exp.response?.statusCode ?? 400,
    );
  }

  Function(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) get request => _dio!.request;

  /// GET: method
  Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) get getRequest => _dio!.get;

  /// POST: method
  Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) get postRequest => _dio!.post;

  /// PUT: method
  Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) get putRequest => _dio!.put;

  /// DELETE: method
  Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) get deleteRequest => _dio!.delete;

  Future<Response> call(Options options) async {
    try {
      Response response =
          await _dio!.get(Endpoints.resetPassword, options: options);
      return response;
    } on DioException catch (exp) {
      return errorHandler(exp);
    }
  }
}
