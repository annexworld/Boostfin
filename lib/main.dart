import 'package:boostfin/app_config.dart';
import 'package:boostfin/routes.dart';
import 'package:boostfin/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:boostfin/theme/theme_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:boostfin/ui_layer/ui_layer.export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  initializeGetitServiceLocator(AppConfigs(
      'https://boostfin-api.onrender.com/api', EnvironmentConfig.dev, 'v1'));

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(390.0, 844.0),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp.router(
            routerConfig: AppRoutes().getRoutesConfig,
            title: 'BoostFin',
            theme: theme,
          );
        });
  }
}
