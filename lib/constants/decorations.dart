import 'package:flutter/material.dart';

class Decorations {
  static textfieldInputDecorations(String hintText, BuildContext context) =>
      InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).focusColor),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          border: const OutlineInputBorder());
}
