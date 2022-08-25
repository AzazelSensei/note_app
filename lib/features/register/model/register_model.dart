// To parse this JSON data, do
//
//     final pokedexResult = pokedexResultFromJson(jsonString);

import 'dart:convert';

RegisterModelPost pokedexResultFromJson(String str) =>
    RegisterModelPost.fromJson(json.decode(str));

String pokedexResultToJson(RegisterModelPost data) =>
    json.encode(data.toJson());

class RegisterModelPost {
  RegisterModelPost({
    this.message,
    this.statusCode,
  });

  String? message;
  String? statusCode;

  factory RegisterModelPost.fromJson(Map<String, dynamic> json) =>
      RegisterModelPost(
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
      };
}
