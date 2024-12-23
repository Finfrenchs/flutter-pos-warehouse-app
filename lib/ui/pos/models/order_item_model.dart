import 'dart:convert';

import '../../../data/models/response/inventory_response/product_response_model.dart';

class OrderItem {
  final Product product;
  int quantity;
  OrderItem({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  // Map<String, dynamic> toMapForLocal(int orderId) {
  //   return {
  //     'id_order': orderId,
  //     'id_product': product.id,
  //     'quantity': quantity,
  //     'price': product.price,
  //   };
  // }

  // static OrderItemModel fromMapLocal(Map<String, dynamic> map) {
  //   return OrderItemModel(
  //     productId: map['id_product']?.toInt() ?? 0,
  //     quantity: map['quantity']?.toInt() ?? 0,
  //     totalPrice: map['price']?.toInt() ?? 0 * (map['quantity']?.toInt() ?? 0),
  //   );
  // }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
