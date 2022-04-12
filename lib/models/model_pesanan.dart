import 'package:admin/models/model_paket_wedding.dart';
import 'package:admin/models/model_user.dart';

class ModelPesanan {
  int id;
  ModelUser user;
  ModelPaketWedding paketWedding;
  String notes;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  ModelPesanan({
    required this.id,
    required this.user,
    required this.paketWedding,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  static List<ModelPesanan> fromJsonList(jsonList) {
    return jsonList.map<ModelPesanan>((obj) => ModelPesanan.fromJson(obj)).toList();
  }

  factory ModelPesanan.fromJson(json) => ModelPesanan(
        id: json["id"],
        user: ModelUser.fromJson(json["users_permissions_users"][0]),
        paketWedding: ModelPaketWedding.fromJson(json["paket_weddings"][0]),
        notes: json["notes"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
      );
}
