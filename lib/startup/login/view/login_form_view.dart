// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmut/service/service.dart';
import 'package:bmut/startup/login/view_model/login_view_model.dart';
import 'package:bmut/startup/model/response_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/const_strings.dart';
import '../../../constants/decorations.dart';
import '../../../constants/turkish_texts.dart';

class LoginFormView extends StatefulWidget {
  const LoginFormView({super.key});

  @override
  State<LoginFormView> createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: constraints.maxWidth * 0.9,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == "") {
                      return TurkishTexts.thisFiledCantEmpty;
                    }
                    if (!RegExp(ConstStrings.emailRegex).hasMatch(value)) {
                      return TurkishTexts.emailWarn;
                    }
                    email = value;
                    return null;
                  },
                  decoration: Decorations.textfieldInputDecorations(
                      TurkishTexts.email, context),
                )),
            splitterBox(constraints),
            SizedBox(
                width: constraints.maxWidth * 0.9,
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value!.isEmpty || value == "") {
                      return TurkishTexts.thisFiledCantEmpty;
                    }
                    if (!RegExp(ConstStrings.passwordRegex).hasMatch(value)) {
                      return TurkishTexts.passwordWarn;
                    }
                    password = value;
                    return null;
                  },
                  decoration: Decorations.textfieldInputDecorations(
                      TurkishTexts.password, context),
                )),
            splitterBox(constraints),
            buildButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton buildButton() {
    return ElevatedButton(
        onPressed: () async {
          if (!_formKey.currentState!.validate()) return;
          final responseModel =
              await LoginViewModel.login(email: email!, password: password!);
          if (responseModel.type == "success") {
            Navigator.pushNamedAndRemoveUntil(
                context, "/test", (route) => false);
          } else {
            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    title: TurkishTexts.error,
                    desc: responseModel.message)
                .show();
          }
        },
        child: const Text(TurkishTexts.login));
  }

  SizedBox splitterBox(BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight * .02,
    );
  }
}
