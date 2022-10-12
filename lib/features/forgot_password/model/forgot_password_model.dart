// To parse this JSON data, do
//
//     final pokedexResult = pokedexResultFromJson(jsonString);

import 'dart:convert';

ForgotPassword forgotPasswordFromJson(String str) =>
    ForgotPassword.fromJson(json.decode(str));

String forgotResultToJson(ForgotPassword data) => json.encode(data.toJson());

class ForgotPassword {
  ForgotPassword({
    this.message,
    this.statusCode,
  });

  String? message;
  String? statusCode;

  factory ForgotPassword.fromJson(Map<String, dynamic> json) => ForgotPassword(
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
      };
}
