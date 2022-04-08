import 'package:admin/providers/base_provider.dart';
import 'package:admin/screens/splash/splash_screen.dart';
import 'package:admin/utility/constants.dart';
import 'package:admin/utility/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: BaseProviders.providerList,
        child: MyApp(),
      );
    }),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    EasyLoading.instance..indicatorType = EasyLoadingIndicatorType.chasingDots;
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
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
