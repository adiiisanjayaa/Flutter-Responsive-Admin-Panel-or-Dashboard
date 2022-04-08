import 'dart:developer';
import 'dart:io';

import 'package:admin/api/api_interface.dart';
import 'package:admin/models/model_user.dart';
import 'package:admin/utility/client.dart';
import 'package:admin/utility/helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as p;

class ApiUser {
  ApiUser._privateConstructor();
  static final ApiUser instance = ApiUser._privateConstructor();

  //DECLARATION VARIABLES
  String _users = Client.BASE_URL + "users";
  final _uploadFileUrl = Client.BASE_URL + 'upload';

  //FUNCTION GET USER
  Future<ModelUser?> getUser(String email) async {
    var _dio = ApiInterface.instance.api;
    try {
      var response = await _dio.get(_users + "?email=$email");
      return ModelUser.fromJson(response.data[0]);
    } catch (e) {
      log("failed getUser: " + e.toString());
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

  //FUNCTION PUT PROFILE IMAGE
  Future putProfileImage(File image, profileId) async {
    var _dio = ApiInterface.instance.api;
    String imageName = DateTime.now().toString() + image.path.split('/').last;
    FormData formData = FormData.fromMap(
      {
        "files": await MultipartFile.fromFile(image.path, filename: imageName, contentType: MediaType('image', p.extension(image.path))),
      },
    );

    try {
      await _dio.post(
        _uploadFileUrl,
        data: formData,
        onSendProgress: (received, total) {
          if (total != -1) {
            EasyLoading.showProgress(received / total, status: (received / total * 100).toStringAsFixed(0) + '%', maskType: EasyLoadingMaskType.clear);
          }
          if ((received / total * 100) == 100) {
            EasyLoading.dismiss();
            EasyLoading.show(status: "Updating profile picture...", maskType: EasyLoadingMaskType.clear);
          }
        },
      ).then((value) async {
        var fileUrl = value.data[0];
        Map body = {
          "image": fileUrl,
        };

        try {
          var response = await _dio.put(
            _users + "/$profileId",
            data: body,
          );
          return response.data;
        } catch (e) {
          log("failed upload image profile");
          return null;
        }
      });
    } catch (e) {
      log("failed upload image profile");
      return null;
    }
  }
}
