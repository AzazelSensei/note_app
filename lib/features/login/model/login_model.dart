// To parse this JSON data, do
//
//     final pokedexResult = pokedexResultFromJson(jsonString);

import 'dart:convert';

LoginModelPost loginResultFromJson(String str) =>
    LoginModelPost.fromJson(json.decode(str));

String pokedexResultToJson(LoginModelPost data) => json.encode(data.toJson());

class LoginModelPost {
  LoginModelPost({
    this.message,
    this.statusCode,
  });

  String? message;
  String? statusCode;

  factory LoginModelPost.fromJson(Map<String, dynamic> json) => LoginModelPost(
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
      };
}
