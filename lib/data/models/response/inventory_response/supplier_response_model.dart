import 'dart:convert';

class SupplierResponseModel {
  final String? status;
  final String? message;
  final List<Supplier>? data;

  SupplierResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory SupplierResponseModel.fromJson(String str) =>
      SupplierResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SupplierResponseModel.fromMap(Map<String, dynamic> json) =>
      SupplierResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Supplier>.from(
                json["data"]!.map((x) => Supplier.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Supplier {
  final int? id;
  final String? name;
  final String? slug;
  final dynamic description;
  final String? address;
  final String? phone;
  final String? email;
  final dynamic contactPerson;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Supplier({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.address,
    this.phone,
    this.email,
    this.contactPerson,
    this.createdAt,
    this.updatedAt,
  });

  factory Supplier.fromJson(String str) => Supplier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Supplier.fromMap(Map<String, dynamic> json) => Supplier(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        contactPerson: json["contact_person"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return '$name';
  }
}
