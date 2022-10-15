// To parse this JSON data, do
//
//     final getQuestion = getQuestionFromJson(jsonString);

import 'dart:convert';

GetQuestion getQuestionFromJson(String str) =>
    GetQuestion.fromJson(json.decode(str));

String getQuestionToJson(GetQuestion data) => json.encode(data.toJson());

class GetQuestion {
  GetQuestion({
    this.message,
    this.statusCode,
  });

  String? message;
  String? statusCode;

  factory GetQuestion.fromJson(Map<String, dynamic> json) => GetQuestion(
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
      };
}
