import 'package:bmut/startup/register/view/register_form_view.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: RegisterFormView()),
    );
  }
}
