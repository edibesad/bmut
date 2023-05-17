import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class MyService {
  static const androidUrl = "http://localhost:3000";
  static const iosUrl = "127.0.0.1:3000";

  static Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    final client = http.Client();
    late Uri url;

    if (Platform.isIOS) {
      url = Uri.http(iosUrl, "get_user");
    } else {
      url = Uri.http(androidUrl, "get_user");
    }

    try {
      final response =
          await client.post(url, body: {"email": email, "password": password});
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }

    return {"type": "error", "message": "Error!"};
  }

  static Future<Map<String, dynamic>> register(
      {required String email, required String password}) async {
    final client = http.Client();
    late Uri url;
    if (Platform.isIOS) {
      url = Uri.http(iosUrl, "register");
    } else {
      url = Uri.http(androidUrl, "register");
    }
    try {
      final response =
          await client.post(url, body: {"email": email, "password": password});

      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
    return {"type": "error", "message": "Error!"};
  }
}
