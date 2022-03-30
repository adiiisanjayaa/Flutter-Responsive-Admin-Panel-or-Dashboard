import 'package:admin/providers/base_provider.dart';
import 'package:admin/screens/splash/splash_screen.dart';
import 'package:admin/utility/constants.dart';
import 'package:admin/utility/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: BaseProviders.providerList,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bali Wedding',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      initialRoute: SplashScreen.KEY,
    );
  }
}
