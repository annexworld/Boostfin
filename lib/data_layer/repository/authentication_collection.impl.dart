import 'package:boostfin/core/utility/type_definitions.dart';
import 'package:boostfin/domain_layer/domain_layer.export.dart';
import 'package:boostfin/network_layer/api_service.dart';
import 'package:boostfin/network_layer/endpoints.dart';
import 'package:boostfin/service_locator.dart';
import 'package:dio/dio.dart';

class AuthenticationCollectionImpl
    implements AuthenticationCollectionInterface {
  final ApiService _api = getit<ApiService>();
  @override
  Future<Response> completeStateOne(RequestPayload data) async {
    try {
      Response res =
          await _api.postRequest(Endpoints.completedStateOne, data: data);

      return res;
    } on DioException catch (err) {
      return _api.errorHandler(err);
    }
  }

  @override
  Future<Response> forgotPassword(RequestPayload data) async {
    try {
      Response res =
          await _api.postRequest(Endpoints.forgotPassword, data: data);

      return res;
    } on DioException catch (err) {
      return _api.errorHandler(err);
    }
  }

  @override
  Future<Response> resetPassword(RequestPayload data) async {
    try {
      Response res =
          await _api.postRequest(Endpoints.resetPassword, data: data);

      return res;
    } on DioException catch (err) {
      return _api.errorHandler(err);
    }
  }

  @override
  Future<Response> signinUser(RequestPayload data) async {
    try {
      Response res = await _api.postRequest(Endpoints.loginUser, data: data);

      return res;
    } on DioException catch (err) {
      return _api.errorHandler(err);
    }
  }

  @override
  Future<Response> stageOne(RequestPayload data) async {
    try {
      Response res =
          await _api.postRequest(Endpoints.onboardingStateOne, data: data);

      return res;
    } on DioException catch (err) {
      return _api.errorHandler(err);
    }
  }

  @override
  Future<Response> stageTwo(RequestPayload data) async {
    try {
      Response res =
          await _api.postRequest(Endpoints.onboardingStateTwo, data: data);

      return res;
    } on DioException catch (err) {
      return _api.errorHandler(err);
    }
  }

  @override
  Future<Response> stateThree(RequestPayload data) async {
    try {
      Response res =
          await _api.postRequest(Endpoints.onboardingStateThree, data: data);

      return res;
    } on DioException catch (err) {
      return _api.errorHandler(err);
    }
  }
}
