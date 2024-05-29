import 'package:boostfin/core/utility/type_definitions.dart';
import 'package:dio/dio.dart';

abstract interface class AuthenticationCollectionInterface {
  Future<Response> signinUser(RequestPayload data);
  Future<Response> stageOne(RequestPayload data);
  Future<Response> stageTwo(RequestPayload data);
  Future<Response> stateThree(RequestPayload data);
  Future<Response> completeStateOne(RequestPayload data);
  Future<Response> forgotPassword(RequestPayload data);
  Future<Response> resetPassword(RequestPayload data);
}
