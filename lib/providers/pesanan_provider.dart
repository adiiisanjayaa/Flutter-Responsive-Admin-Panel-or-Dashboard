import 'package:admin/api/api_pesanan.dart';
import 'package:admin/models/model_pesanan.dart';
import 'package:flutter/material.dart';

class PesananProvider extends ChangeNotifier {
  List<ModelPesanan> _pesanan = [];
  List<ModelPesanan> get pesanan => _pesanan;

  initPesanan(String userId) async {
    _pesanan = await ApiPesanan.instance.getPesanan(userId);
    notifyListeners();
  }
}
