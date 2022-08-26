import 'dart:convert';

LoginUserModel userResultFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String pokedexResultToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  LoginUserModel({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        username: json["message"],
        password: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": username,
        "statusCode": password,
      };
}
