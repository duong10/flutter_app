import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/app/navigation/router_location.dart';

class BottomNavigation extends StatelessWidget {
  final Widget child;
  const BottomNavigation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon((Icons.home)), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon((Icons.account_balance)),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon((Icons.settings)),
            label: "Setting",
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRouterLocation.homePage.path)) {
      return 0;
    }
    if (location.startsWith(AppRouterLocation.accountPage.path)) {
      return 1;
    }
    if (location.startsWith(AppRouterLocation.settingPage.path)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(AppRouterLocation.homePage.path);
      case 1:
        GoRouter.of(context).go(AppRouterLocation.accountPage.path);
      case 2:
        GoRouter.of(context).go(AppRouterLocation.settingPage.path);
    }
  }
}
