import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/auth/register_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/utility/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const KEY = "/SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacementNamed(context, LoginScreen.KEY);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        body: Center(
          child: SizedBox(height: 200, width: 200, child: Image.asset("assets/images/logo.png")),
        ));
  }
}
