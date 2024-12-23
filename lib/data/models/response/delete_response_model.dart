import 'dart:convert';

class DeleteResponseModel {
  final String? message;

  DeleteResponseModel({
    this.message,
  });

  factory DeleteResponseModel.fromJson(String str) =>
      DeleteResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteResponseModel.fromMap(Map<String, dynamic> json) =>
      DeleteResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
