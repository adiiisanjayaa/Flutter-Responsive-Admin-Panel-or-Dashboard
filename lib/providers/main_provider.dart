import 'package:flutter/material.dart';

enum CurrentSelectedItem {
  PAKET_WEDDING,
  PESANAN,
}

class MainProvider extends ChangeNotifier {
  CurrentSelectedItem _currentSelectedItem = CurrentSelectedItem.PAKET_WEDDING;
  CurrentSelectedItem get currentSelectedItem => _currentSelectedItem;

  //ON TAP BOTTOM NAV BAR
  void onSideBarItemTap(BuildContext context, int index) {
    _currentSelectedItem = CurrentSelectedItem.values[index];
    notifyListeners();
  }
}
