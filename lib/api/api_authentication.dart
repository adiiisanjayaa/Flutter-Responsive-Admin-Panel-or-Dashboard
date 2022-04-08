import 'dart:developer';

import 'package:admin/models/model_user.dart';
import 'package:admin/utility/client.dart';
import 'package:admin/utility/helpers.dart';
import 'package:admin/utility/session_manager.dart';
import 'package:dio/dio.dart';

class ApiAuthentication {
  ApiAuthentication._privateConstructor();
  static final ApiAuthentication instance = new ApiAuthentication._privateConstructor();

  //DECLARATION LOCAL VARIABLES
  late Dio _dioAuth;
  String _urlLogin = Client.BASE_URL + "auth/local";
  String _urlRegister = Client.BASE_URL + "auth/local/register";

  //FUNCTION INITIALIZED
  Future<void> initializeToken() async {
    String? email = await SessionManager.instance.getEmail();
    String? password = await SessionManager.instance.getPassword();
    if (email != null && password != null) {
      String? token;
      token = await ApiAuthentication.instance.apiLogin(email, password);
      if (token != null) {
        await SessionManager.instance.setBearerToken(token);
      }
    }
  }

  //FUNCTION REGISTER
  Future<String?> apiRegister(String email, String username, String password) async {
    _dioAuth = Dio();
    try {
      var response = await _dioAuth.post(
        _urlRegister,
        data: Helpers.buildRegisterData(email, username, password),
      );
      return response.data["jwt"];
    } catch (e) {
      log("apiRegisterError: " + e.toString());
      return null;
    }
  }

  //FUNCTION LOGIN
  Future<String?> apiLogin(String email, String password) async {
    var _dioAuth = Dio();
    try {
      var response = await _dioAuth.post(
        _urlLogin,
        data: Helpers.buildLoginData(email, password),
      );
      print(response.data);
      ModelUser user = ModelUser.fromJson(response.data["user"]);
      String jwt = response.data["jwt"];
      SessionManager.instance.setBearerToken(jwt);
      SessionManager.instance.setUser(user);
      return jwt;
    } catch (e) {
      log("apiLoginError: " + e.toString());
      return null;
    }
  }
}
