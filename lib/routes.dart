import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//
import 'package:boostfin/ui_layer/ui_layer.export.dart';
export 'package:go_router/go_router.dart';

enum Routes {
  //
  root(path: '/'),
  splashScreenPage1(path: 'splash_screen_page_one'),
  //
  signupPage(path: 'signup_page'),
  otpPage(path: 'otp_page'),
  signinPage(path: 'signin_page'),
  homePage(path: '/home_page'),
  loanPage(path: '/loan_page'),
  menuPage(path: '/menu_page'),
  profilePage(path: '/profile_page'),
  createPasswordPage(path: 'create_password_page'),
  createNewPasswordPage(path: 'create_new_password_page'),
  registerBVNPage(path: 'bvn_validation_Page'),
  verifyAccountPage(path: 'verify_account_page');

  const Routes({required this.path});
  final String path;

  String get navigate {
    if (this.path.startsWith('/')) {
      return this.path;
    }
    return '/${this.path}';
  }
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

class AppRoutes {
  ///
  GoRouter get getRoutesConfig => _router;
  static final GoRouter _router = GoRouter(
    refreshListenable: null,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.root.path,
    routes: [
      // root route as entry point of the application
      GoRoute(
        path: Routes.root.path,
        builder: (context, state) => const SplashScreenPage(),
        routes: <RouteBase>[
          GoRoute(
            path: Routes.splashScreenPage1.path,
            builder: (context, state) {
              return const SplashScreenPage1();
            },
          ),
          GoRoute(
            path: Routes.signupPage.path,
            builder: (context, state) {
              return SignupPage();
            },
            routes: [
              GoRoute(
                path: Routes.verifyAccountPage.path,
                builder: (context, state) {
                  return const VerifyDetailsPage();
                },
              ),
              GoRoute(
                path: Routes.createPasswordPage.path,
                builder: (context, state) {
                  return const CreateUserPasswordPage();
                },
              ),
              GoRoute(
                path: Routes.registerBVNPage.path,
                builder: (context, state) {
                  return const ProvideBVNPage();
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.signinPage.path,
            builder: (context, state) {
              return const SignInPage();
            },
            routes: [
              GoRoute(
                path: Routes.createNewPasswordPage.path,
                builder: (context, state) {
                  return const CreateNewPasswordPage();
                },
              ),
            ],
          ),
          GoRoute(
              path: Routes.otpPage.path,
              builder: (context, state) {
                return const Scaffold();
              }),
        ],
      ),
// App Routes
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return DashboardNavigationScreen(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          // Home tab routes
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                // parentNavigatorKey: _rootNavigatorKey,
                path: Routes.homePage.path,
                name: Routes.homePage.name,
                builder: (BuildContext context, GoRouterState state) {
                  return const DashboardHomePage();
                },
                routes: [],
              ),
            ],
          ),
          // Ponds tab routesR
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              path: Routes.loanPage.path,
              builder: (BuildContext context, GoRouterState state) {
                return const Scaffold();
              },
              routes: [],
            ),
          ]),
          //
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.menuPage.path,
                builder: (BuildContext context, GoRouterState state) {
                  return const Scaffold();
                },
                routes: [],
              ),
            ],
          ),
          //
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              path: Routes.profilePage.path,
              // name: AppRoute.sellPage.path,
              builder: (BuildContext context, GoRouterState state) {
                return const Scaffold();
              },
            ),
          ]),
        ],
      ),
    ],
  );
}
