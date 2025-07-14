import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/model/user_model.dart';

class SharedPrefManager {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? getString(String key) => _prefs.getString(key);

  static Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);

  static bool getBool(String key) => _prefs.getBool(key) ?? false;

  static Future<bool> setBool(String key, bool value) =>
      _prefs.setBool(key, value);

  static Future<bool> remove(String key) => _prefs.remove(key);

  static UserModel? getUser() {
    final jsonString = _prefs.getString('user');
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return UserModel.fromJson(jsonMap);
  }
}
