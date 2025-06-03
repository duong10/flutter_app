enum AppRouterLocation {
  homePage(name: 'homePage', path: '/homePage'),
  loginPage(name: 'loginPage', path: '/loginPage'),
  registerPage(name: 'registerPage', path: '/registerPage'),
  authPage(name: 'authPage', path: '/authPage');

  final String path;
  final String name;

  const AppRouterLocation({required this.path, required this.name});
}
