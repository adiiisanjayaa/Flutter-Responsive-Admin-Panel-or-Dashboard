import 'package:admin/providers/menu_provider.dart';
import 'package:admin/providers/main_provider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/paket_wedding/paket_wedding.dart';
import 'package:admin/screens/main/pesanan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  static const KEY = "/MainScreen";

  listPage(BuildContext context, index) {
    final List<Widget> _pages = [
      PaketWeddingScreen(),
      PesananScreen(),
      PaketWeddingScreen(),
    ];
    return _pages[index];
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
                // default flex = 1
                // and it takes 1/6 part of the screen
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
