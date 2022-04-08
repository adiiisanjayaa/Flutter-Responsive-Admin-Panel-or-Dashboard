import 'package:admin/providers/main_provider.dart';
import 'package:admin/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const KEY = "/SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print("object");
    context.read<MainProvider>().initSession(context);
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
