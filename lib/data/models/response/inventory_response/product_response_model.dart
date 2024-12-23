import 'dart:convert';

import 'brands_response_model.dart';
import 'category_response_model.dart';
import 'unit_response_model.dart';
import 'warehouse_response_model.dart';

class ProductResponseModel {
  final String? status;
  final String? message;
  final List<Product>? data;

  ProductResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductResponseModel.fromJson(String str) =>
      ProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Product {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final String? image;
  final int? categoryId;
  final int? brandId;
  final int? unitId;
  final int? companyId;
  final int? warehouseId;
  final int? price;
  final int? stock;
  final int? alertStock;
  final int? status;
  final String? itemCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? photo;
  final Category? category;
  final Brand? brand;
  final Unit? unit;
  final Warehouse? warehouse;
  int quantity; // Tambahkan quantity
  int get subtotal => quantity * price!; // Hitung subtotal otomatis

  Product({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.categoryId,
    this.brandId,
    this.unitId,
    this.companyId,
    this.warehouseId,
    this.price,
    this.stock,
    this.alertStock,
    this.status,
    this.itemCode,
    this.createdAt,
    this.updatedAt,
    this.photo,
    this.category,
    this.brand,
    this.unit,
    this.warehouse,
    this.quantity = 1, // Default quantity
  });

  //int get priceInt => int.parse(price!.replaceAll('.00', ''));

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        unitId: json["unit_id"],
        companyId: json["company_id"],
        warehouseId: json["warehouse_id"],
        price: json["price"],
        stock: json["stock"],
        alertStock: json["alert_stock"],
        status: json["status"],
        itemCode: json["item_code"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        photo: json["photo"],
        category: json["category"] == null
            ? null
            : Category.fromMap(json["category"]),
        brand: json["brand"] == null ? null : Brand.fromMap(json["brand"]),
        unit: json["unit"] == null ? null : Unit.fromMap(json["unit"]),
        warehouse: json["warehouse"] == null
            ? null
            : Warehouse.fromMap(json["warehouse"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "category_id": categoryId,
        "brand_id": brandId,
        "unit_id": unitId,
        "company_id": companyId,
        "warehouse_id": warehouseId,
        "price": price,
        "stock": stock,
        "alert_stock": alertStock,
        "status": status,
        "item_code": itemCode,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "photo": photo,
        "category": category?.toMap(),
        "brand": brand?.toMap(),
        // "unit": unit?.toMap(),
        "warehouse": warehouse?.toMap(),
      };

  @override
  String toString() {
    return '$name';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.description == description &&
        other.image == image &&
        other.categoryId == categoryId &&
        other.brandId == brandId &&
        other.unitId == unitId &&
        other.companyId == companyId &&
        other.warehouseId == warehouseId &&
        other.price == price &&
        other.stock == stock &&
        other.alertStock == alertStock &&
        other.status == status &&
        other.itemCode == itemCode &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.photo == photo &&
        other.category == category &&
        other.brand == brand &&
        other.unit == unit &&
        other.warehouse == warehouse;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        description.hashCode ^
        image.hashCode ^
        categoryId.hashCode ^
        brandId.hashCode ^
        unitId.hashCode ^
        companyId.hashCode ^
        warehouseId.hashCode ^
        price.hashCode ^
        stock.hashCode ^
        alertStock.hashCode ^
        status.hashCode ^
        itemCode.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        photo.hashCode ^
        category.hashCode ^
        brand.hashCode ^
        unit.hashCode ^
        warehouse.hashCode;
  }
}

// class Warehouse {
//   final int? id;
//   final String? name;
//   final String? slug;
//   final dynamic description;
//   final String? address;
//   final String? phone;
//   final String? email;
//   final dynamic contactPerson;
//   final int? companyId;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   Warehouse({
//     this.id,
//     this.name,
//     this.slug,
//     this.description,
//     this.address,
//     this.phone,
//     this.email,
//     this.contactPerson,
//     this.companyId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Warehouse.fromJson(String str) => Warehouse.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Warehouse.fromMap(Map<String, dynamic> json) => Warehouse(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         description: json["description"],
//         address: json["address"],
//         phone: json["phone"],
//         email: json["email"],
//         contactPerson: json["contact_person"],
//         companyId: json["company_id"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "description": description,
//         "address": address,
//         "phone": phone,
//         "email": email,
//         "contact_person": contactPerson,
//         "company_id": companyId,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }
