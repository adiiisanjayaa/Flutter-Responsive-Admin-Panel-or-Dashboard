import 'package:admin/models/model_paket_wedding.dart';
import 'package:admin/models/model_pesanan.dart';
import 'package:admin/screens/auth/login_screen.dart';
import 'package:admin/screens/auth/register_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/paket_wedding/detail_paket_wedding_screen.dart';
import 'package:admin/screens/paket_wedding/preview_image_screen.dart';
import 'package:admin/screens/pesanan/detail_pesanan_screen.dart';
import 'package:admin/screens/pesanan/konfirmasi_pesanan_screen.dart';
import 'package:admin/screens/profile/profile_screen.dart';
import 'package:admin/screens/splash/splash_screen.dart';
import 'package:admin/utility/route_argument.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MainScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => MainScreen(),
          settings: RouteSettings(name: MainScreen.KEY),
        );
      case LoginScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: RouteSettings(name: LoginScreen.KEY),
        );
      case RegisterScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
          settings: RouteSettings(name: RegisterScreen.KEY),
        );
      case ProfileScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
          settings: RouteSettings(name: ProfileScreen.KEY),
        );
      case SplashScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: RouteSettings(name: SplashScreen.KEY),
        );
      case DetailPaketWeddingScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => DetailPaketWeddingScreen(paketWedding: args as RouteArgument<ModelPaketWedding>),
          settings: RouteSettings(name: DetailPaketWeddingScreen.KEY),
        );
      case DetailPesananScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => DetailPesananScreen(pesanan: args as RouteArgument<ModelPesanan>),
          settings: RouteSettings(name: DetailPesananScreen.KEY),
        );
      case KonfirmasiPesananScreen.KEY:
        return MaterialPageRoute(
          builder: (context) => KonfirmasiPesananScreen(data: args as RouteArgument<KonfirmasiPesananScreenArguments>),
          settings: RouteSettings(name: KonfirmasiPesananScreen.KEY),
        );
      case PreviewImagePage.KEY:
        return MaterialPageRoute(
          builder: (context) => PreviewImagePage(image: args as RouteArgument<String>),
          settings: RouteSettings(name: PreviewImagePage.KEY),
        );
      default:
        return null;
    }
  }
}
