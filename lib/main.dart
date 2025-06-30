import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:login/auth/auth_page.dart';
import 'package:login/firebase_options.dart';
import 'package:login/pages/account_page.dart';
import 'package:login/pages/home/home_page.dart';
import 'package:login/pages/setting_page.dart';

import 'app/navigation/bottom_navigation.dart';
import 'app/navigation/router_location.dart';
import 'injection/dependency_manager.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: AuthPage());
//   }
// }

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await DependencyManager.inject();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRouterLocation.homePage.path,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return BottomNavigation(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: AppRouterLocation.homePage.path,
            name: AppRouterLocation.homePage.name,
            builder: (context, state) => HomePage(),
          ),
          GoRoute(
            path: AppRouterLocation.accountPage.path,
            name: AppRouterLocation.accountPage.name,
            builder: (context, state) => AccountPage(),
          ),
          GoRoute(
            path: AppRouterLocation.settingPage.path,
            name: AppRouterLocation.settingPage.name,
            builder: (context, state) => SettingPage(),
          ),
        ],
      ),
      GoRoute(
        path: AppRouterLocation.authPage.path,
        name: AppRouterLocation.authPage.name,
        builder: (context, state) => AuthPage(),
      ),
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleWH: () => kIsWeb ? false : true,
      builder: (_, context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          title: "GoRouter Demo",
        );
      },
    );
  }
}
