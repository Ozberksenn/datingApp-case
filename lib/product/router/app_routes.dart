class AppRoutes {
  AppRoutes._();

  static String path(String route) {
    return '/$route';
  }

  static const String splash = 'splash';
  static const String login = 'login';
  static const String register = 'register';
  static const String home = 'home';
  static const String addPhoto = 'addPhoto';
}
