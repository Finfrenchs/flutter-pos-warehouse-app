import 'dart:convert';

import 'orders_response_model.dart';

class OrderCreateResponseModel {
  final String? status;
  final String? message;
  final Order? data;

  OrderCreateResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory OrderCreateResponseModel.fromJson(String str) =>
      OrderCreateResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderCreateResponseModel.fromMap(Map<String, dynamic> json) =>
      OrderCreateResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Order.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}
