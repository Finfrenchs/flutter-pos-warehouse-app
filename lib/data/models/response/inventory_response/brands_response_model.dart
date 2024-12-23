import 'dart:convert';


class BrandsResponseModel {
  final String? status;
  final String? message;
  final List<Brand>? data;

  BrandsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory BrandsResponseModel.fromJson(String str) =>
      BrandsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BrandsResponseModel.fromMap(Map<String, dynamic> json) =>
      BrandsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Brand>.from(json["data"]!.map((x) => Brand.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Brand {
  final int? id;
  final String? name;
  final String? slug;
  final dynamic description;
  final String? image;
  final int? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Brand({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        companyId: json["company_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "company_id": companyId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return '$name';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Brand &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.description == description &&
        other.image == image &&
        other.companyId == companyId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        description.hashCode ^
        image.hashCode ^
        companyId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
