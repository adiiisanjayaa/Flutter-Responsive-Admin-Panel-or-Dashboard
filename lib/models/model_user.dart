import 'package:admin/utility/client.dart';
import 'package:admin/utility/helpers.dart';

class ModelUser {
  ModelUser({
    required this.id,
    required this.username,
    required this.email,
    required this.alamat,
    required this.noHp,
    required this.jenisKelamin,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  int id;
  String name;
  String username;
  String email;
  String alamat;
  String noHp;
  String jenisKelamin;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;

  static List<ModelUser> fromJsonList(jsonList) {
    return jsonList.map<ModelUser>((obj) => ModelUser.fromJson(obj)).toList();
  }

  factory ModelUser.fromJson(json) => ModelUser(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        alamat: json["alamat"],
        noHp: json["no_hp"],
        jenisKelamin: json["jenis_kelamin"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        image: json["image"] is Map
            ? Helpers.getServerImage(json["image"])
            : json["image"].contains(Client.baseImageUrl)
                ? json["image"]
                : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "alamat": alamat,
        "no_hp": noHp,
        "jenis_kelamin": jenisKelamin,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "name": name,
      };
}
