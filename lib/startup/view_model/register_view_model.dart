import 'dart:convert';
import 'dart:io';

import 'package:bmut/startup/model/response_model.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class RegisterViewModel {
  static const androidUrl = "http://localhost:3000";
  static const iosUrl = "127.0.0.1:3000";

  static Future<ResponseModel> register(
      {required String email, required String password}) async {
    List<int> bytes = utf8.encode(password);
    Digest digest = sha256.convert(bytes);
    var client = http.Client();
    late Uri url;
    if (Platform.isIOS) {
      url = Uri.http(iosUrl, "register");
    } else {
      url = Uri.http(androidUrl, "register");
    }
    try {
      print("request sent");
      var response = await client
          .post(url, body: {"email": email, "password": digest.toString()});
      print(response.body);

      return ResponseModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
    }
    return ResponseModel(type: "error", message: "Error!");
  }
}
