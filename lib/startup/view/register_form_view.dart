// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmut/constants/const_strings.dart';
import 'package:bmut/startup/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bmut/constants/decorations.dart';
import 'package:bmut/constants/turkish_texts.dart';

import '../model/response_model.dart';

class RegisterFormView extends StatefulWidget {
  const RegisterFormView({super.key});

  @override
  State<RegisterFormView> createState() => _RegisterFormViewState();
}

class _RegisterFormViewState extends State<RegisterFormView> {
  bool checkbox = false;
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
                    if (password != value) {
                      return TurkishTexts.passwordAgainWarn;
                    }
                    return null;
                  },
                  decoration: Decorations.textfieldInputDecorations(
                      TurkishTexts.passwordAgain, context),
                )),
            splitterBox(constraints),
            buildCheckbox(constraints),
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
          if (!checkbox) {
            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    title: TurkishTexts.checkboxWarn)
                .show();
            return;
          }
          ResponseModel response = await RegisterViewModel.register(
              email: email!, password: password!);
          if (response.type == "success") {
            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    title: TurkishTexts.success,
                    desc: TurkishTexts.registerSuccsessDesc)
                .show()
                .then((value) => Navigator.pop(context));
          } else if (response.type == "error") {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              title: TurkishTexts.error,
              desc: response.message,
            ).show();
          }
        },
        child: const Text(TurkishTexts.register));
  }

  SizedBox buildCheckbox(BoxConstraints constraints) {
    return SizedBox(
      width: constraints.maxWidth * 0.95,
      child: Row(
        children: [
          Checkbox(
              value: checkbox,
              onChanged: (value) {
                setState(() {
                  checkbox = !checkbox;
                });
              }),
          const Text(TurkishTexts.agree),
        ],
      ),
    );
  }

  SizedBox splitterBox(BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight * .02,
    );
  }
}
