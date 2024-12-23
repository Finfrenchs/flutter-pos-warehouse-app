import 'dart:convert';

class CustomersResponseModel {
  final String? status;
  final String? message;
  final List<Customer>? data;

  CustomersResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CustomersResponseModel.fromJson(String str) =>
      CustomersResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomersResponseModel.fromMap(Map<String, dynamic> json) =>
      CustomersResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Customer>.from(
                json["data"]!.map((x) => Customer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Customer {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic twoFactorConfirmedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? username;
  final int? companyId;
  final int? isSuperadmin;
  final dynamic warehouseId;
  final int? roleId;
  final String? userType;
  final int? loginEnabled;
  final dynamic profileImage;
  final String? status;
  final String? phone;
  final String? address;
  final dynamic departmentId;
  final dynamic designationId;
  final dynamic shiftId;

  Customer({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.companyId,
    this.isSuperadmin,
    this.warehouseId,
    this.roleId,
    this.userType,
    this.loginEnabled,
    this.profileImage,
    this.status,
    this.phone,
    this.address,
    this.departmentId,
    this.designationId,
    this.shiftId,
  });

  factory Customer.fromJson(String str) => Customer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        username: json["username"],
        companyId: json["company_id"],
        isSuperadmin: json["is_superadmin"],
        warehouseId: json["warehouse_id"],
        roleId: json["role_id"],
        userType: json["user_type"],
        loginEnabled: json["login_enabled"],
        profileImage: json["profile_image"],
        status: json["status"],
        phone: json["phone"],
        address: json["address"],
        departmentId: json["department_id"],
        designationId: json["designation_id"],
        shiftId: json["shift_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "company_id": companyId,
        "is_superadmin": isSuperadmin,
        "warehouse_id": warehouseId,
        "role_id": roleId,
        "user_type": userType,
        "login_enabled": loginEnabled,
        "profile_image": profileImage,
        "status": status,
        "phone": phone,
        "address": address,
        "department_id": departmentId,
        "designation_id": designationId,
        "shift_id": shiftId,
      };

  @override
  String toString() {
    return '$name';
  }
}
