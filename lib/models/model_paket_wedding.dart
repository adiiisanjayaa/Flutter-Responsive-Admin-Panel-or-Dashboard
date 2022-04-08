import 'package:admin/utility/helpers.dart';
import 'package:admin/utility/client.dart' as client;

class ModelPaketWedding {
  ModelPaketWedding({
    required this.id,
    required this.namaPaket,
    required this.keterangan,
    required this.totalHarga,
    required this.status,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.gallery,
  });

  int id;
  String namaPaket;
  String keterangan;
  int totalHarga;
  String status;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String? image;
  List<ModelGallery> gallery;

  static List<ModelPaketWedding> fromJsonList(jsonList) {
    return jsonList.map<ModelPaketWedding>((obj) => ModelPaketWedding.fromJson(obj)).toList();
  }

  factory ModelPaketWedding.fromJson(json) => ModelPaketWedding(
        id: json["id"],
        namaPaket: json["nama_paket"],
        keterangan: json["keterangan"],
        totalHarga: json["total_harga"],
        status: json["status"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: Helpers.getServerImage(json["image"]),
        gallery: ModelGallery.fromJsonList(json["gallery"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_paket": namaPaket,
        "keterangan": keterangan,
        "total_harga": totalHarga,
        "status": status,
        "published_at": publishedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
      };
}

class ModelGallery {
  final String image;
  ModelGallery({
    required this.image,
  });

  factory ModelGallery.fromJson(json) => ModelGallery(
        image: client.Client.baseImageUrl + json["url"],
      );

  static List<ModelGallery> fromJsonList(jsonList) {
    return jsonList.map<ModelGallery>((obj) => ModelGallery.fromJson(obj)).toList();
  }
}
