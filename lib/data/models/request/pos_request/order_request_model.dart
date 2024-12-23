import 'dart:convert';

class OrderRequestModel {
  final int? userId;
  final String? customerNote;
  final String? orderNumber;
  final int? total;
  final String? status;
  final String? paymentStatus;
  final String? paymentType;
  final List<OrderItemModel>? items;

  OrderRequestModel({
    this.userId,
    this.customerNote,
    this.orderNumber,
    this.total,
    this.status,
    this.paymentStatus,
    this.paymentType,
    this.items,
  });

  factory OrderRequestModel.fromJson(String str) =>
      OrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromMap(Map<String, dynamic> json) =>
      OrderRequestModel(
        userId: json["user_id"],
        customerNote: json["customer_note"],
        orderNumber: json["order_number"],
        total: json["total"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        paymentType: json["payment_type"],
        items: json["items"] == null
            ? []
            : List<OrderItemModel>.from(
                json["items"]!.map((x) => OrderItemModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "customer_note": customerNote,
        "order_number": orderNumber,
        "total": total,
        "status": status,
        "payment_status": paymentStatus,
        "payment_type": paymentType,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class OrderItemModel {
  final int? productId;
  final int? quantity;
  final int? price;
  final int? total;

  OrderItemModel({
    this.productId,
    this.quantity,
    this.price,
    this.total,
  });

  factory OrderItemModel.fromJson(String str) =>
      OrderItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromMap(Map<String, dynamic> json) => OrderItemModel(
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "total": total,
      };
}
