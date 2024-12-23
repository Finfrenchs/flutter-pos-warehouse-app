import 'dart:convert';

class CustomerRequestModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;

  CustomerRequestModel({
    this.name,
    this.email,
    this.phone,
    this.address,
  });

  factory CustomerRequestModel.fromJson(String str) =>
      CustomerRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerRequestModel.fromMap(Map<String, dynamic> json) =>
      CustomerRequestModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
      };
}
