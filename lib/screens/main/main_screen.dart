import 'dart:convert';

import 'package:admin/models/model_user.dart';
import 'package:admin/providers/menu_provider.dart';
import 'package:admin/providers/main_provider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/paket_wedding/paket_wedding.dart';
import 'package:admin/screens/main/pesanan.dart';
import 'package:admin/utility/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  static const KEY = "/MainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  listPage(BuildContext context, index) {
    final List<Widget> _pages = [
      PaketWeddingScreen(),
      PesananScreen(),
    ];
    return _pages[index];
  }

  @override
  void initState() {
    var mainProvider = context.read<MainProvider>();
    init(mainProvider);
    super.initState();
  }

  init(MainProvider mainProvider) async {
    if (mainProvider.user == null) {
      var dataUser = await SessionManager.instance.getUser();
      if (dataUser != null) {
        var newUser = ModelUser.fromJson(json.decode(dataUser));
        mainProvider.setUpdateUser(newUser);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuProvider>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Consumer<MainProvider>(builder: (context, provider, _) {
              return Expanded(
                flex: 5,
                child: listPage(context, provider.currentSelectedItem.index),
              );
            }),
          ],
        ),
      ),
    );
  }
}
