import 'package:admin/providers/main_provider.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/profile/profile_screen.dart';
import 'package:admin/utility/constants.dart';
import 'package:admin/utility/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainProvider = context.read<MainProvider>();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Paket Wedding",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              mainProvider.onSideBarItemTap(context, 0);
              Navigator.pop(context);
            },
            index: 0,
          ),
          DrawerListTile(
            title: "Pesanan",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              mainProvider.onSideBarItemTap(context, 1);
              Navigator.pop(context);
            },
            index: 1,
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.pushNamed(context, ProfileScreen.KEY);
            },
            index: 3,
          ),
          DrawerListTile(
            title: "Logout",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () async {
              EasyLoading.show(status: "Loading...");
              await SessionManager.instance.logout();
              EasyLoading.dismiss();
              Navigator.pushReplacementNamed(context, LoginScreen.KEY);
            },
            index: 4,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.index,
  }) : super(key: key);

  final String title, svgSrc;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, provider, _) {
      return ListTile(
        selected: index == provider.currentSelectedItem.index,
        selectedTileColor: secondaryPrimaryColor,
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          color: Colors.white54,
          height: 16,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white54),
        ),
      );
    });
  }
}
