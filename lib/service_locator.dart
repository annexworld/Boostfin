import 'package:boostfin/app_config.dart';
import 'package:boostfin/domain_layer/usecases/onboarding_usecases/signup_stage_one.usecase.dart';
import 'package:boostfin/network_layer/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data_layer/data_layer.export.dart';
import 'domain_layer/domain_layer.export.dart';

final GetIt getit = GetIt.I;

void initializeGetitServiceLocator(AppConfigs config) {
  // Utility Service Class
  // getit.registerFactory(() => HiveAuthService());
  // getit.registerFactory(() => HiveUserProfileService());
  // getit.registerFactory(() => HiveNotificationService());
  getit.registerSingleton(<AppConfigs>() => config);
  getit.registerFactory<ApiService>(
      () => ApiService(Dio(), baseUrl: config.baseUrl)
        ..initBaseOptions()
        ..initializeInterceptors());

  /// interfaces & implementations
  getit.registerFactory<AuthenticationCollectionInterface>(
      () => AuthenticationCollectionImpl());

  /// usecases
  getit.registerFactory<SignupStageOneUsecase>(() => SignupStageOneUsecase());
}
