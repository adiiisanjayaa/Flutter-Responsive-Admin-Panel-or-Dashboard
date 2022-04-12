import 'package:admin/providers/main_provider.dart';
import 'package:admin/providers/menu_provider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/profile/profile_screen.dart';
import 'package:admin/utility/assets.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../utility/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuProvider>().controlMenu,
          ),

        // Expanded(child: SearchField()),
        Expanded(
          child: Text(
            "Bali Wedding",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, mainProvider, _) {
      return mainProvider.user == null
          ? IconButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.KEY);
              },
              icon: Icon(Icons.login),
            )
          : GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProfileScreen.KEY);
              },
              child: Container(
                margin: EdgeInsets.only(left: defaultPadding),
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.white10),
                ),
                child: Consumer<MainProvider>(builder: (context, mainProvider, _) {
                  return mainProvider.user != null
                      ? Row(
                          children: [
                            ExtendedImage.network(
                              mainProvider.user!.image ?? "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                              width: 38,
                              height: 38,
                              shape: BoxShape.circle,
                            ),
                            if (!Responsive.isMobile(context))
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                                child: Text(mainProvider.user!.name),
                              ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        )
                      : SizedBox.shrink();
                }),
              ),
            );
    });
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(Assets.icMenuSearch),
          ),
        ),
      ),
    );
  }
}
