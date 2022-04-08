import 'dart:convert';
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

  static String buildRegisterData(String email, String username, String password) {
    return jsonEncode({
      "email": email,
      "username": username,
      "password": password,
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

  static String buildCreatePesananData(int idPaketWedding, int idUser, String notes) {
    return jsonEncode({
      "paket_weddings": idPaketWedding,
      "users_permissions_users": idUser,
      "notes": notes,
    });
  }

  static String dateFormater(date) {
    String formattedDate = DateFormat('dd MMM, yyyy – kk:mm').format(date);
    return formattedDate;
  }
}
