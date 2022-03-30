import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/auth/register_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/profile/profile_screen.dart';
import 'package:admin/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MainScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => MainScreen(),
          settings: RouteSettings(name: MainScreen.KEY),
        );
      case LoginScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: RouteSettings(name: LoginScreen.KEY),
        );
      case RegisterScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
          settings: RouteSettings(name: RegisterScreen.KEY),
        );
      case ProfileScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
          settings: RouteSettings(name: ProfileScreen.KEY),
        );
      case SplashScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: RouteSettings(name: SplashScreen.KEY),
        );
      default:
        return null;
    }
  }
}
