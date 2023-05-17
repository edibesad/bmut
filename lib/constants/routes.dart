import 'package:bmut/screens/startup/login/login_screen.dart';
import 'package:bmut/screens/startup/register/register_screen.dart';
import 'package:bmut/screens/startup/startup_screen.dart';
import 'package:bmut/test.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/startup': (context) => const StartupScreen(),
    '/register': (context) => const RegisterScreen(),
    '/login': (context) => const LoginScreen(),
    '/test': (context) => const TestScreen()
  };
}
