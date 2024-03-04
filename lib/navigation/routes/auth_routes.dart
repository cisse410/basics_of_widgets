import 'package:flutter/material.dart';
import 'package:johan/auth/login.dart';
import 'package:johan/auth/main_screen.dart';
import 'package:johan/auth/register.dart';

class AuthRouteManager {
  static const String main = '/';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (context) => const MainForm());
      case login:
        return MaterialPageRoute(builder: (context) => const Login());
      case register:
        return MaterialPageRoute(builder: (context) => const Register());
      default:
        throw const FormatException('Route Introuvable');
    }
  }
}
