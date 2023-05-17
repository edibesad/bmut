import 'package:bmut/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  static Future<bool> saveUserToStorage(UserModel user) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      print(await pref.setString("_id", user.id!));
      print(await pref.setString("email", user.email!));
      print(await pref.setString("password", user.password!));
      return await pref.setString("_id", user.id!) &&
          await pref.setString("email", user.email!) &&
          await pref.setString("password", user.password!);
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> removeUserFromStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      return await pref.clear();
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<Map<String, dynamic>> getUserFromStorage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      return {
        "_id": pref.getString("_id"),
        "email": pref.getString("email"),
        "password": pref.getString("password")
      };
    } catch (e) {
      print(e);
    }
    return {};
  }
}
