import 'dart:developer';

import 'package:admin/api/api_interface.dart';
import 'package:admin/models/model_user.dart';
import 'package:admin/utility/client.dart';
import 'package:admin/utility/helpers.dart';

class ApiUser {
  ApiUser._privateConstructor();
  static final ApiUser instance = ApiUser._privateConstructor();

  //DECLARATION VARIABLES
  String _users = Client.BASE_URL + "users";

  //FUNCTION GET USER
  Future<ModelUser?> getUser(String email) async {
    var _dio = ApiInterface.instance.api;
    try {
      var response = await _dio.get(_users + "?email=$email");
      return ModelUser.fromJson(response.data);
    } catch (e) {
      log("failed getPaymentMethod: " + e.toString());
      return null;
    }
  }

  //FUNCTION UPDATE USER
  Future<bool> updateUser(ModelUser user) async {
    var _dio = ApiInterface.instance.api;
    try {
      var response = await _dio.put(
        _users + "/${user.id}",
        data: Helpers.buildUpdateUserData(
          user.name,
          user.email,
          user.alamat,
          user.noHp,
        ),
      );
      return response.statusCode == 200 ? true : false;
    } catch (e) {
      log("failed updateUser: " + e.toString());
      return false;
    }
  }
}
