// To parse this JSON data, do
//
//     final baseErrorResponseModel = baseErrorResponseModelFromJson(jsonString);

import 'dart:convert';

BaseErrorResponseModel baseErrorResponseModelFromJson(String str) =>
    BaseErrorResponseModel.fromJson(json.decode(str));

String baseErrorResponseModelToJson(BaseErrorResponseModel data) =>
    json.encode(data.toJson());

class BaseErrorResponseModel {
  final String error;

  BaseErrorResponseModel({
    this.error = 'Failed, check your connection',
  });

  factory BaseErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      BaseErrorResponseModel(
        error: json['error'] ??
            (json['message'] ?? (json['errors'] as List).first['message']),
      );

  Map<String, dynamic> toJson() => {
        'error': error,
      };
}
