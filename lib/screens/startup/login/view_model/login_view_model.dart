import 'dart:convert';
import 'package:bmut/model/user_model.dart';
import 'package:bmut/service/device_storage.dart';
import 'package:crypto/crypto.dart';

import '../../../../service/service.dart';
import '../../model/response_model.dart';

class LoginViewModel {
  static Future<ResponseModel> login(
      {required String email, required String password}) async {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);

    final response =
        await MyService.login(email: email, password: digest.toString());
    ResponseModel responseModel = ResponseModel.fromJson(response);

    if (responseModel.user != null) {
      print(await DeviceStorage.saveUserToStorage(
          UserModel.fromJson(responseModel.user!)));
    }

    return responseModel;
  }
}
