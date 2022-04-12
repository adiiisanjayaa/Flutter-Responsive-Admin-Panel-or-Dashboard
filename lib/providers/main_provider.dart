import 'dart:convert';

import 'package:admin/api/api_authentication.dart';
import 'package:admin/models/model_register.dart';
import 'package:admin/models/model_user.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/utility/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

enum CurrentSelectedItem {
  PAKET_WEDDING,
  PESANAN,
}

class MainProvider extends ChangeNotifier {
  CurrentSelectedItem _currentSelectedItem = CurrentSelectedItem.PAKET_WEDDING;
  CurrentSelectedItem get currentSelectedItem => _currentSelectedItem;

  ModelUser? _user;
  ModelUser? get user => _user;

  ModelRegister _register = ModelRegister();
  ModelRegister get register => _register;

  set register(value) {
    _register = value;
  }

  Future<bool> registerUser() async {
    bool isRegister = await ApiAuthentication.instance.apiRegister(_register);
    if (isRegister) {
      EasyLoading.showSuccess("Successfully Register");
    } else {
      EasyLoading.showError("Failed to Register");
    }

    return isRegister;
  }

  //ON TAP BOTTOM NAV BAR
  void onSideBarItemTap(BuildContext context, int index) {
    _currentSelectedItem = CurrentSelectedItem.values[index];
    notifyListeners();
  }

  ModelUser? _updateUser;
  ModelUser? get updateUser => _updateUser;

  set updateUser(value) {
    _updateUser = value;
    notifyListeners();
  }

  setUpdateUser(ModelUser user) {
    _user = user;
    notifyListeners();
  }

  login(context, email, pass) async {
    EasyLoading.show(status: "Loading...");
    String? token = await ApiAuthentication.instance.apiLogin(email, pass);
    if (token != null) {
      var dataUser = await SessionManager.instance.getUser();
      if (dataUser != null) {
        var newUser = ModelUser.fromJson(json.decode(dataUser));
        setUpdateUser(newUser);
      }

      EasyLoading.dismiss();
      Navigator.pushReplacementNamed(context, MainScreen.KEY);
    } else {
      EasyLoading.showError("Login Failed");
    }
  }

  Future initSession(context) async {
    var newUser = await SessionManager.instance.getUser();
    if (newUser != null) {
      _user = ModelUser.fromJson(json.decode(newUser));
    }

    Navigator.pushReplacementNamed(context, MainScreen.KEY);
  }
}
