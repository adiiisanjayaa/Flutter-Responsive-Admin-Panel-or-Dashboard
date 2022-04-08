import 'dart:developer';

import 'package:admin/api/api_interface.dart';
import 'package:admin/models/model_pesanan.dart';
import 'package:admin/utility/client.dart';
import 'package:admin/utility/helpers.dart';

class ApiPesanan {
  ApiPesanan._privateConstructor();
  static final ApiPesanan instance = ApiPesanan._privateConstructor();

  //DECLARATION VARIABLES
  String _pesanans = Client.BASE_URL + "pesanans";

  //FUNCTION GET PESANAN
  Future<List<ModelPesanan>> getPesanan(String userId) async {
    var _dio = ApiInterface.instance.api;
    _dio.options.queryParameters.clear();
    try {
      var response = await _dio.get(_pesanans + "?users_permissions_users=$userId");
      return ModelPesanan.fromJsonList(response.data);
    } catch (e) {
      log("failed getPesanan: " + e.toString());
      return [];
    }
  }

  //FUNCTION GET PESANAN
  Future<bool> createPesanan(ModelPesanan pesanan) async {
    var _dio = ApiInterface.instance.api;
    _dio.options.queryParameters.clear();
    try {
      var response = await _dio.post(_pesanans, data: Helpers.buildCreatePesananData(pesanan.paketWedding.id, pesanan.user.id, pesanan.notes));
      return response.statusCode == 200 ? true : false;
    } catch (e) {
      log("failed createPesanan: " + e.toString());
      return false;
    }
  }
}
