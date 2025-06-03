import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/auth/auth.dart';
import 'package:login/firebase_options.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/register_page.dart';

import 'app/navigation/router_location.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: AppRouterLocation.authPage.path,
    routes: [
      GoRoute(
        path: AppRouterLocation.authPage.path,
        name: AppRouterLocation.authPage.name,
        builder: (context, state) => AuthPage(),
      ),
      GoRoute(
        path: AppRouterLocation.loginPage.path,
        name: AppRouterLocation.loginPage.name,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: AppRouterLocation.registerPage.path,
        name: AppRouterLocation.registerPage.name,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: AppRouterLocation.homePage.path,
        name: AppRouterLocation.homePage.name,
        builder: (context, state) => HomePage(),
      ),
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: "GoRouter Demo",
    );
  }
}
