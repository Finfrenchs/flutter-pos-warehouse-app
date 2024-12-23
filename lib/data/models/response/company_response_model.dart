import 'dart:convert';

class CompanyResponseModel {
  final String? message;
  final Company? company;

  CompanyResponseModel({
    this.message,
    this.company,
  });

  factory CompanyResponseModel.fromJson(String str) =>
      CompanyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyResponseModel.fromMap(Map<String, dynamic> json) =>
      CompanyResponseModel(
        message: json["message"],
        company:
            json["company"] == null ? null : Company.fromMap(json["company"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "company": company?.toMap(),
      };
}

class Company {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? website;
  final String? logo;
  final String? address;
  final String? status;
  final int? totalUsers;
  final String? clockInTime;
  final String? clockOutTime;
  final int? earlyClockInTime;
  final int? allowClockOutTill;
  final bool? selfClocking;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Company({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.website,
    this.logo,
    this.address,
    this.status,
    this.totalUsers,
    this.clockInTime,
    this.clockOutTime,
    this.earlyClockInTime,
    this.allowClockOutTill,
    this.selfClocking,
    this.createdAt,
    this.updatedAt,
  });

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
        logo: json["logo"],
        address: json["address"],
        status: json["status"],
        totalUsers: json["total_users"],
        clockInTime: json["clock_in_time"],
        clockOutTime: json["clock_out_time"],
        earlyClockInTime: json["early_clock_in_time"],
        allowClockOutTill: json["allow_clock_out_till"],
        selfClocking: json["self_clocking"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "website": website,
        "logo": logo,
        "address": address,
        "status": status,
        "total_users": totalUsers,
        "clock_in_time": clockInTime,
        "clock_out_time": clockOutTime,
        "early_clock_in_time": earlyClockInTime,
        "allow_clock_out_till": allowClockOutTill,
        "self_clocking": selfClocking,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
