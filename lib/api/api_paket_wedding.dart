import 'dart:developer';

import 'package:admin/api/api_interface.dart';
import 'package:admin/models/model_paket_wedding.dart';
import 'package:admin/utility/client.dart';

class ApiPaketWedding {
  ApiPaketWedding._privateConstructor();
  static final ApiPaketWedding instance = ApiPaketWedding._privateConstructor();

  //DECLARATION VARIABLES
  String _paketWedding = Client.BASE_URL + "paket-weddings";

  //FUNCTION GET PESANAN
  Future<List<ModelPaketWedding>> getPaketWedding() async {
    var _dio = ApiInterface.instance.api;
    try {
      var response = await _dio.get(_paketWedding + "?status=available");
      return ModelPaketWedding.fromJsonList(response.data);
    } catch (e) {
      log("failed getPaketWedding: " + e.toString());
      return [];
    }
  }
}
