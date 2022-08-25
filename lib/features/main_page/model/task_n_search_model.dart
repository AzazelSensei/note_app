// To parse this JSON data, do
//
//     final pokedexResult = pokedexResultFromJson(jsonString);

import 'dart:convert';

TaskNSearchModelGPPD pokedexResultFromJson(String str) => TaskNSearchModelGPPD.fromJson(json.decode(str));

String pokedexResultToJson(TaskNSearchModelGPPD data) => json.encode(data.toJson());

class TaskNSearchModelGPPD {
    TaskNSearchModelGPPD({
        this.message,
        this.statusCode,
    });

    List<Message>? message;
    String? statusCode;

    factory TaskNSearchModelGPPD.fromJson(Map<String, dynamic> json) => TaskNSearchModelGPPD(
        message: json["message"] == null ? null : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : List<dynamic>.from(message!.map((x) => x.toJson())),
        "statusCode": statusCode,
    };
}

class Message {
    Message({
        this.body,
        this.id,
        this.name,
    });

    String? body;
    int? id;
    String? name;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        body: json["body"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "body": body,
        "id": id,
        "name": name,
    };
}