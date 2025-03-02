import 'dart:convert';

class CompanyRequestModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? website;
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

  CompanyRequestModel({
    this.name,
    this.email,
    this.phone,
    this.website,
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

  factory CompanyRequestModel.fromJson(String str) =>
      CompanyRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyRequestModel.fromMap(Map<String, dynamic> json) =>
      CompanyRequestModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
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
        "name": name,
        "email": email,
        "phone": phone,
        "website": website,
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
