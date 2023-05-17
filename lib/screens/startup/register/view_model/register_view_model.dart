import 'dart:convert';
import 'package:bmut/service/service.dart';
import 'package:bmut/screens/startup/model/response_model.dart';
import 'package:crypto/crypto.dart';

class RegisterViewModel {
  static Future<ResponseModel> register(
      {required String email, required String password}) async {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);

    final response =
        await MyService.register(email: email, password: digest.toString());

    return ResponseModel.fromJson(response);
  }
}
