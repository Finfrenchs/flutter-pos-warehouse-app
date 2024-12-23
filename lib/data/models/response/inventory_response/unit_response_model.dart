import 'dart:convert';


class UnitResponseModel {
  final String? status;
  final String? message;
  final List<Unit>? data;

  UnitResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory UnitResponseModel.fromJson(String str) =>
      UnitResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UnitResponseModel.fromMap(Map<String, dynamic> json) =>
      UnitResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Unit>.from(json["data"]!.map((x) => Unit.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Unit {
  final int? id;
  final String? name;
  final String? slug;
  final dynamic description;
  final String? shortName;
  final int? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Unit({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.shortName,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory Unit.fromJson(String str) => Unit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Unit.fromMap(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        shortName: json["short_name"],
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
        "short_name": shortName,
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

    return other is Unit &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.description == description &&
        other.shortName == shortName &&
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
        shortName.hashCode ^
        companyId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
