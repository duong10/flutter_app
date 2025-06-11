enum AppRouterLocation {
  homePage(name: 'homePage', path: '/homePage'),
  loginPage(name: 'loginPage', path: '/loginPage'),
  registerPage(name: 'registerPage', path: '/registerPage'),
  authPage(name: 'authPage', path: '/authPage'),
  accountPage(name: 'accountPage', path: '/accountPage'),
  settingPage(name: 'settingPage', path: '/settingPage'),
  bottomNavigation(name: 'bottomNavigation', path: 'bottomNavigation');

  final String path;
  final String name;

  const AppRouterLocation({required this.path, required this.name});
}
