import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //Write Data
  Future<bool> setInt({required String key, required int value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt(key, value);
  }

  Future<bool> setString({required String key, required String value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  Future<bool> setBool({required String key, required bool value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(key, value);
  }

  Future<bool> setDouble({required String key, required double value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setDouble(key, value);
  }

  //Read Data
  Future<int?> getInt(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key);
  }

  Future<double?> getDouble(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getDouble(key);
  }

  Future<String?> getString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  Future<bool?> getBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  //Remove Data
  Future<bool> removeKey(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(key);
  }
}
