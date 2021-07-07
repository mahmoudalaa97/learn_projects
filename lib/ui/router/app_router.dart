import 'package:flutter/material.dart';
import 'package:learn_projects/ui/screen/home_screen.dart';
import 'package:learn_projects/ui/screen/splash_screen.dart';

class AppRouter {
  const AppRouter._();

  /// add here your route
  /// ```example
  ///   static const String login = '/HereYourRoute';
  /// ````
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      default:
        throw ('Route not found!');
    }
  }
}
