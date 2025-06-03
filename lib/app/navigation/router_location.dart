enum AppRouterLocation {
  homePage(name: 'homePage', path: '/homePage'),
  loginPage(name: 'loginPage', path: '/loginPage'),
  registerPage(name: 'registerPage', path: '/registerPage');

  final String path;
  final String name;

  const AppRouterLocation({required this.path, required this.name});
}
