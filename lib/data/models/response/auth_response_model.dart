import 'dart:convert';

class AuthResponseModel {
  final String? message;
  final String? accessToken;
  final User? user;

  AuthResponseModel({
    this.message,
    this.accessToken,
    this.user,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"],
        accessToken: json["access_token"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "access_token": accessToken,
        "user": user?.toMap(),
      };

  AuthResponseModel copyWith({
    String? message,
    String? accessToken,
    User? user,
  }) {
    return AuthResponseModel(
      message: message ?? this.message,
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
    );
  }
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic twoFactorConfirmedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? username;
  final int? companyId;
  final int? isSuperadmin;
  // final int? warehouseId;
  // final int? roleId;
  final String? userType;
  // final int? loginEnabled;
  final String? profileImage;
  final String? status;
  final String? phone;
  final String? address;
  // final int? departmentId;
  // final int? designationId;
  // final int? shiftId;
  // final Shift? shift;
  // final Department? department;
  // final Designation? designation;
  //final Role? role;
  // final List<Role>? roles;

  User({
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
    // this.warehouseId,
    // this.roleId,
    this.userType,
    // this.loginEnabled,
    this.profileImage,
    this.status,
    this.phone,
    this.address,
    // this.departmentId,
    // this.designationId,
    // this.shiftId,
    // this.shift,
    // this.department,
    // this.designation,
    // this.roles,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
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
        isSuperadmin: json["is_superadmin"] != null
            ? int.tryParse(json["is_superadmin"].toString())
            : null,
        // warehouseId: json["warehouse_id"] != null
        //     ? int.tryParse(json["warehouse_id"].toString())
        //     : null,
        // roleId: json["role_id"] != null
        //     ? int.tryParse(json["role_id"].toString())
        //     : null,
        // userType: json["user_type"],
        // //userType: userTypeValues.map[json["user_type"]]!,
        // loginEnabled: json["login_enabled"] != null
        //     ? int.tryParse(json["login_enabled"].toString())
        //     : null,
        profileImage: json["profile_image"],
        status: json["status"],
        //status: statusValues.map[json["status"]]!,
        phone: json["phone"],
        address: json["address"],
        // departmentId: json["department_id"] != null
        //     ? int.tryParse(json["department_id"].toString())
        //     : null,
        // designationId: json["designation_id"] != null
        //     ? int.tryParse(json["designation_id"].toString())
        //     : null,
        // shiftId: json["shift_id"] != null
        //     ? int.tryParse(json["shift_id"].toString())
        //     : null,
        // shift: json["shift"] == null ? null : Shift.fromMap(json["shift"]),
        // department: json["department"] == null
        //     ? null
        //     : Department.fromMap(json["department"]),
        // designation: json["designation"] == null
        //     ? null
        //     : Designation.fromMap(json["designation"]),
        // //role: json["role"] == null ? null : Role.fromMap(json["role"]),
        // roles: json["roles"] == null
        //     ? []
        //     : List<Role>.from(json["roles"]!.map((x) => Role.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "company_id": companyId,
        "is_superadmin": isSuperadmin,
        // "warehouse_id": warehouseId,
        // "role_id": roleId,
        "user_type": userType,
        //"user_type": userTypeValues.reverse[userType],

        // "login_enabled": loginEnabled,
        "profile_image": profileImage,
        "status": status,
        //"status": statusValues.reverse[status],

        "phone": phone,
        "address": address,
        // "department_id": departmentId,
        // "designation_id": designationId,
        // "shift_id": shiftId,
        // "shift": shift?.toMap(),
        // "department": department?.toMap(),
        // "designation": designation?.toMap(),
        //"role": role?.toMap(),
        // "roles": roles == null
        //     ? []
        //     : List<dynamic>.from(roles!.map((x) => x.toMap())),
      };
  @override
  String toString() => name!;
}
