import 'package:bmut/startup/register_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/register': (context) => const RegisterScreen(),
  };
}
