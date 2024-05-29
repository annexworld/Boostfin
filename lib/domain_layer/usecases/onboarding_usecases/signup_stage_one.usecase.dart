import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:boostfin/core/utility/type_definitions.dart';
import 'package:boostfin/domain_layer/domain_layer.export.dart';
import 'package:boostfin/network_layer/error_parser.dart';
import 'package:boostfin/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignupStageOneUsecase {
  SignupStageOneUsecase({this.service}) {
    service = this.service ?? getit<AuthenticationCollectionInterface>();
  }

  late AuthenticationCollectionInterface? service;

  Future<Either<ErrorParser?, bool>> call(RequestPayload data) async {
    Response res = await service!.stageOne(data);

    if (res.getResponseStatus) {
      return Right(true);
    }
    return Left(res.data);
  }
}
