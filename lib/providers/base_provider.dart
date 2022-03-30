import 'package:admin/providers/menu_provider.dart';
import 'package:admin/providers/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class BaseProviders {
  // Tambah provider disini
  static final List<SingleChildWidget> providerList = [
    ChangeNotifierProvider<MainProvider>(create: (context) => MainProvider()),
    ChangeNotifierProvider<MenuProvider>(create: (context) => MenuProvider()),
  ];
}
