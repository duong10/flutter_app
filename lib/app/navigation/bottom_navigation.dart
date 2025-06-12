import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:login/app/navigation/router_location.dart';
import 'package:login/app/resouces/app_colors.dart';

import '../../gen/assets.gen.dart';
import '../resouces/app_text_styles.dart';

class BottomNavigation extends StatelessWidget {
  final Widget child;
  const BottomNavigation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: context.colors.green3,
            unselectedItemColor: context.colors.black,
            selectedLabelStyle: AppTextStyle.regular12,
            unselectedLabelStyle: AppTextStyle.regular12,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _iconTheme(context, Assets.icons.icStore, true),
                activeIcon: _iconTheme(context, Assets.icons.icStore, false),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                // icon: Icon((Icons.account_balance)),
                icon: _iconTheme(context, Assets.icons.icCart, true),
                activeIcon: _iconTheme(context, Assets.icons.icCart, false),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: _iconTheme(context, Assets.icons.icFavorite, true),
                activeIcon: _iconTheme(context, Assets.icons.icFavorite, false),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: _iconTheme(context, Assets.icons.icUser, true),
                activeIcon: _iconTheme(context, Assets.icons.icUser, false),
                label: "Setting",
              ),
            ],
            currentIndex: _calculateSelectedIndex(context),
            onTap: (int index) {
              _currentIndex = index;
              return _onItemTapped(index, context);
            },
          ),
        ),
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
    if (location.startsWith(AppRouterLocation.settingPage.path)) {
      return 3;
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

Widget _iconTheme(BuildContext context, String icName, bool icSelect) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: SvgPicture.asset(
      icName,
      colorFilter: ColorFilter.mode(
        icSelect ? context.colors.black : context.colors.green3,
        BlendMode.srcIn,
      ),
    ),
  );
}
