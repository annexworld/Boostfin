import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:boostfin/core/utility/type_definitions.dart';
import 'package:boostfin/data_layer/data_layer.export.dart';
import 'package:boostfin/domain_layer/entities/signin.entity.dart';
import 'package:boostfin/domain_layer/interface/authentication.interface.dart';
import 'package:boostfin/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SigninUsecase {
  SigninUsecase({this.service}) {
    service = this.service ?? getit<AuthenticationCollectionInterface>();
  }

  late AuthenticationCollectionInterface? service;

  Future<EitherErrorOrResponse<SigninResponse>> call(
      RequestPayload request) async {
    Response res = await service!.signinUser(request);

    if (res.getResponseStatus) {
      final SigninResponse response =
          SigninResponseModel.fromJson(res.data["data"]);

    //todo: save authication token
    //todo: save user profile
    //todo: do some business logic
      return Right(response);
    }

    return Left(res.data);
  }
}
