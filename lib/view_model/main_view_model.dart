import 'package:bmut/service/device_storage.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class MainViewModel {
  static isUserLoggedIn() async {
    UserModel userModel =
        UserModel.fromJson(await DeviceStorage.getUserFromStorage());
    return userModel.id != null &&
        userModel.email != null &&
        userModel.password != null;
  }

  //TODO Find better method name
  static navigateChecker(BuildContext context,
      {required VoidCallback onSuccess, required VoidCallback onFail}) async {
    if (await isUserLoggedIn()) {
      print("onSuccess");

      onSuccess.call();
    } else {
      print("onFail");

      onFail.call();
    }
  }
}
