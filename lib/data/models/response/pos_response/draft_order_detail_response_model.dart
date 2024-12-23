import 'dart:convert';

import '../inventory_response/product_response_model.dart';
import 'draft_orders_response_model.dart';

class DraftOrdersDetailResponseModel {
  final String? status;
  final String? message;
  final DraftOrder? data;

  DraftOrdersDetailResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DraftOrdersDetailResponseModel.fromJson(String str) =>
      DraftOrdersDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DraftOrdersDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      DraftOrdersDetailResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : DraftOrder.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

// class Data {
//   final int? id;
//   final int? userId;
//   final String? customerNote;
//   final String? orderNumber;
//   final String? total;
//   final String? status;
//   final String? paymentStatus;
//   final String? paymentType;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final List<Item>? items;

//   Data({
//     this.id,
//     this.userId,
//     this.customerNote,
//     this.orderNumber,
//     this.total,
//     this.status,
//     this.paymentStatus,
//     this.paymentType,
//     this.createdAt,
//     this.updatedAt,
//     this.items,
//   });

//   factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Data.fromMap(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         userId: json["user_id"],
//         customerNote: json["customer_note"],
//         orderNumber: json["order_number"],
//         total: json["total"],
//         status: json["status"],
//         paymentStatus: json["payment_status"],
//         paymentType: json["payment_type"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         items: json["items"] == null
//             ? []
//             : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "user_id": userId,
//         "customer_note": customerNote,
//         "order_number": orderNumber,
//         "total": total,
//         "status": status,
//         "payment_status": paymentStatus,
//         "payment_type": paymentType,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "items": items == null
//             ? []
//             : List<dynamic>.from(items!.map((x) => x.toMap())),
//       };
// }

class Item {
  final int? id;
  final int? orderDraftId;
  final int? productId;
  final int? quantity;
  final String? price;
  final String? total;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? product;

  Item({
    this.id,
    this.orderDraftId,
    this.productId,
    this.quantity,
    this.price,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        orderDraftId: json["order_draft_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product:
            json["product"] == null ? null : Product.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_draft_id": orderDraftId,
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "total": total,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toMap(),
      };
}
