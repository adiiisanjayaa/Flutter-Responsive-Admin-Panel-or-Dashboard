import 'package:admin/api/api_paket_wedding.dart';
import 'package:admin/models/model_paket_wedding.dart';
import 'package:flutter/material.dart';

class WeddingPaketProvider extends ChangeNotifier {
  List<ModelPaketWedding> _paketWedding = [];
  List<ModelPaketWedding> get paketWedding => _paketWedding;

  initPaketWedding() async {
    _paketWedding = await ApiPaketWedding.instance.getPaketWedding();
    notifyListeners();
  }
}
