import 'dart:convert';

import 'draft_orders_response_model.dart';

class DraftOrderCreateUpdateResponseModel {
  final String? status;
  final String? message;
  final DraftOrder? data;

  DraftOrderCreateUpdateResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DraftOrderCreateUpdateResponseModel.fromJson(String str) =>
      DraftOrderCreateUpdateResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DraftOrderCreateUpdateResponseModel.fromMap(
          Map<String, dynamic> json) =>
      DraftOrderCreateUpdateResponseModel(
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
