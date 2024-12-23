import 'dart:convert';

import 'package:flutter_pos_warehouse_app/data/models/response/pos_response/draft_order_detail_response_model.dart';

class DraftOrdersResponseModel {
  final String? status;
  final String? message;
  final List<DraftOrder>? data;

  DraftOrdersResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DraftOrdersResponseModel.fromJson(String str) =>
      DraftOrdersResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DraftOrdersResponseModel.fromMap(Map<String, dynamic> json) =>
      DraftOrdersResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DraftOrder>.from(
                json["data"]!.map((x) => DraftOrder.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DraftOrder {
  final int? id;
  final int? userId;
  final String? customerNote;
  final String? orderNumber;
  final dynamic total;
  final String? status;
  final String? paymentStatus;
  final String? paymentType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Item>? items;

  DraftOrder({
    this.id,
    this.userId,
    this.customerNote,
    this.orderNumber,
    this.total,
    this.status,
    this.paymentStatus,
    this.paymentType,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory DraftOrder.fromJson(String str) =>
      DraftOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DraftOrder.fromMap(Map<String, dynamic> json) => DraftOrder(
        id: json["id"],
        userId: json["user_id"],
        customerNote: json["customer_note"],
        orderNumber: json["order_number"],
        total: _parseTotal(json["total"]),
        status: json["status"],
        paymentStatus: json["payment_status"],
        paymentType: json["payment_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "customer_note": customerNote,
        "order_number": orderNumber,
        "total": total.toString(),
        "status": status,
        "payment_status": paymentStatus,
        "payment_type": paymentType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };

  static dynamic _parseTotal(dynamic total) {
    if (total is int) {
      return total;
    } else if (total is String) {
      final parsedValue = int.tryParse(total);
      return parsedValue ?? total;
    }
    return total; // Default return
  }
}
