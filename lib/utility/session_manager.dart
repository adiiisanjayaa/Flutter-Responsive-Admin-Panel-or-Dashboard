import 'dart:convert';

import 'package:admin/models/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _BEARER_TOKEN = "bearerToken";
  static const String _EMAIL = "email";
  static const String _PASSWORD = "password";
  static const String _USER = "user";

  SessionManager._privateConstructor();
  static final SessionManager instance = SessionManager._privateConstructor();

  static SharedPreferences? _preferences;

  Future<SharedPreferences> get session async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _preferences!;
  }

  Future<bool> logout() async {
    SharedPreferences preferences = await instance.session;
    preferences.remove(_BEARER_TOKEN);
    preferences.remove(_EMAIL);
    preferences.remove(_PASSWORD);
    return preferences.remove(_USER);
  }

  Future<String?> getBearerToken() async {
    SharedPreferences preferences = await instance.session;
    return preferences.getString(_BEARER_TOKEN);
  }

  Future<bool?> setBearerToken(String token) async {
    return await instance.session.then((value) => value.setString(_BEARER_TOKEN, token));
  }

  Future<String?> getEmail() async {
    SharedPreferences preferences = await instance.session;
    return preferences.getString(_EMAIL);
  }

  Future<bool?> setEmail(String email) async {
    return await instance.session.then((value) => value.setString(_EMAIL, email));
  }

  Future<String?> getPassword() async {
    SharedPreferences preferences = await instance.session;
    return preferences.getString(_PASSWORD);
  }

  Future<bool?> setPassword(String email) async {
    return await instance.session.then((value) => value.setString(_PASSWORD, email));
  }

  Future<String?> getUser() async {
    SharedPreferences preferences = await instance.session;
    return preferences.getString(_USER);
  }

  Future<bool?> setUser(ModelUser value) async {
    String user = jsonEncode(value.toJson());
    return await instance.session.then((value) => value.setString(_USER, user));
  }
}
