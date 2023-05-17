import 'package:bmut/startup/login/view/login_form_view.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoginFormView()),
    );
  }
}
