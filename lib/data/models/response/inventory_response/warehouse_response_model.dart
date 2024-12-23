import 'dart:convert';

class WarehouseResponseModel {
  final String? status;
  final String? message;
  final List<Warehouse>? data;

  WarehouseResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory WarehouseResponseModel.fromJson(String str) =>
      WarehouseResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WarehouseResponseModel.fromMap(Map<String, dynamic> json) =>
      WarehouseResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Warehouse>.from(
                json["data"]!.map((x) => Warehouse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Warehouse {
  final int? id;
  final String? name;
  final String? slug;
  final dynamic description;
  final String? address;
  final String? phone;
  final String? email;
  final dynamic contactPerson;
  final int? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Warehouse({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.address,
    this.phone,
    this.email,
    this.contactPerson,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory Warehouse.fromJson(String str) => Warehouse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Warehouse.fromMap(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        contactPerson: json["contact_person"],
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
        "address": address,
        "phone": phone,
        "email": email,
        "contact_person": contactPerson,
        "company_id": companyId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return '$name';
  }
}
