import 'dart:convert';

import 'customers_response_model.dart';

class CustomerAddResponseModel {
  final String? status;
  final String? message;
  final Customer? data;

  CustomerAddResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CustomerAddResponseModel.fromJson(String str) =>
      CustomerAddResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerAddResponseModel.fromMap(Map<String, dynamic> json) =>
      CustomerAddResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Customer.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

// class Data {
//   final int? companyId;
//   final String? name;
//   final String? email;
//   final String? phone;
//   final String? address;
//   final String? status;
//   final String? userType;
//   final int? loginEnabled;
//   final int? isSuperadmin;
//   final int? roleId;
//   final String? username;
//   final DateTime? updatedAt;
//   final DateTime? createdAt;
//   final int? id;

//   Data({
//     this.companyId,
//     this.name,
//     this.email,
//     this.phone,
//     this.address,
//     this.status,
//     this.userType,
//     this.loginEnabled,
//     this.isSuperadmin,
//     this.roleId,
//     this.username,
//     this.updatedAt,
//     this.createdAt,
//     this.id,
//   });

//   factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Data.fromMap(Map<String, dynamic> json) => Data(
//         companyId: json["company_id"],
//         name: json["name"],
//         email: json["email"],
//         phone: json["phone"],
//         address: json["address"],
//         status: json["status"],
//         userType: json["user_type"],
//         loginEnabled: json["login_enabled"],
//         isSuperadmin: json["is_superadmin"],
//         roleId: json["role_id"],
//         username: json["username"],
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         id: json["id"],
//       );

//   Map<String, dynamic> toMap() => {
//         "company_id": companyId,
//         "name": name,
//         "email": email,
//         "phone": phone,
//         "address": address,
//         "status": status,
//         "user_type": userType,
//         "login_enabled": loginEnabled,
//         "is_superadmin": isSuperadmin,
//         "role_id": roleId,
//         "username": username,
//         "updated_at": updatedAt?.toIso8601String(),
//         "created_at": createdAt?.toIso8601String(),
//         "id": id,
//       };
// }
