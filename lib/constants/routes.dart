import 'package:bmut/home/home_screen.dart';
import 'package:bmut/startup/login/login_screen.dart';
import 'package:bmut/startup/register/register_screen.dart';
import 'package:bmut/startup/startup_screen.dart';
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
