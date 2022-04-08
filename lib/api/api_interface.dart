import 'dart:io';

import 'package:admin/api/api_authentication.dart';
import 'package:admin/utility/session_manager.dart';
import 'package:dio/dio.dart';

class ApiInterface {
  late Dio api;
  static final ApiInterface _instance = ApiInterface._privateConstructor();
  factory ApiInterface() => _instance;

  static ApiInterface get instance => _instance;
  ApiInterface._privateConstructor() {
    BaseOptions options = BaseOptions(headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    api = Dio(options);
    api.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await SessionManager.instance.getBearerToken();
          if (token != null) {
            options.headers.addAll({"Authorization": "Bearer $token"});
          }
          handler.next(options);
        },
        onError: (e, handler) => _onError(e, handler),
        onResponse: (e, handler) {
          api.options.queryParameters.clear();
          return handler.next(e);
        },
      ),
    );
  }

  //FUNCTION ON ERROR INTERFACE
  Future<dynamic> _onError(DioError e, ErrorInterceptorHandler handler) async {
    Response? response = e.response;
    api.options.queryParameters.clear();
    if (response?.statusCode == HttpStatus.unauthorized || response?.statusCode == HttpStatus.forbidden) {
      String? email = await SessionManager.instance.getEmail();
      String? password = await SessionManager.instance.getPassword();
      if (email != null && password != null) {
        String? token;
        token = await ApiAuthentication.instance.apiLogin(email, password);
        if (token != null) {
          SessionManager.instance.setBearerToken(token);
          var options = e.response?.requestOptions;
          if (options != null) {
            options.headers.addAll({"Authorization": "Bearer " + token});
            api
                .fetch(options)
                .then(
                  (value) => handler.resolve(value),
                )
                .onError(
                  (error, stackTrace) => handler.reject(e),
                );
          }
        }
      }
      handler.next(e);
    }
    handler.next(e);
  }
}
