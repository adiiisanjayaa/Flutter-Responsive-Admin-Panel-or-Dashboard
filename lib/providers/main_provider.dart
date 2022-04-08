import 'dart:convert';

import 'package:admin/models/model_user.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/utility/session_manager.dart';
import 'package:flutter/material.dart';

enum CurrentSelectedItem {
  PAKET_WEDDING,
  PESANAN,
}

class MainProvider extends ChangeNotifier {
  CurrentSelectedItem _currentSelectedItem = CurrentSelectedItem.PAKET_WEDDING;
  CurrentSelectedItem get currentSelectedItem => _currentSelectedItem;

  ModelUser? _user;
  ModelUser? get user => _user;

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

  Future initSession(context) async {
    var newUser = await SessionManager.instance.getUser();

    if (newUser == null) {
      Navigator.pushReplacementNamed(context, LoginScreen.KEY);
    } else {
      _user = ModelUser.fromJson(json.decode(newUser));
      Navigator.pushReplacementNamed(context, MainScreen.KEY);
    }
  }
}
