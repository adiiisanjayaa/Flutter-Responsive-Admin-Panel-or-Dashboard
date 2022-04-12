import 'dart:convert';
import 'package:admin/models/model_pesanan.dart';
import 'package:admin/models/model_register.dart';
import 'package:intl/intl.dart';

import 'package:admin/utility/client.dart' as client;

class Helpers {
  static String? getServerImage(Map? parent, {String? customSize}) {
    if (parent != null) {
      if (parent["formats"] != null && parent["formats"][customSize ?? "medium"] != null && parent["formats"][customSize ?? "medium"]["url"] != null) {
        return client.Client.baseImageUrl + parent["formats"][customSize ?? "medium"]["url"];
      } else if (parent["url"] != null) {
        return client.Client.baseImageUrl + parent["url"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static String buildLoginData(String email, String password) {
    return jsonEncode({
      "identifier": email,
      "password": password,
    });
  }

  static String buildRegisterData(ModelRegister register) {
    return jsonEncode({
      "name": register.name,
      "email": register.email,
      "username": register.email,
      "no_hp": register.telp,
      "jenis_kelamin": register.kelamin,
      "password": register.pass,
    });
  }

  static String buildUpdateUserData(String name, String email, String alamat, String telp) {
    return jsonEncode({
      "name": name,
      "email": email,
      "alamat": alamat,
      "no_hp": telp,
    });
  }

  static String buildCreatePesananData(ModelPesanan pesanan) {
    return jsonEncode({
      "paket_weddings": pesanan.paketWedding.id,
      "users_permissions_users": pesanan.user.id,
      "notes": pesanan.notes,
      "status": pesanan.status,
    });
  }

  static String dateFormater(date) {
    String formattedDate = DateFormat('dd MMM, yyyy – kk:mm').format(date);
    return formattedDate;
  }
}
