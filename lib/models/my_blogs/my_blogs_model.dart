// To parse this JSON data, do
//
//     final myBlogsModel = myBlogsModelFromJson(jsonString);

import 'dart:convert';

MyBlogsModel myBlogsModelFromJson(String str) => MyBlogsModel.fromJson(json.decode(str));

String myBlogsModelToJson(MyBlogsModel data) => json.encode(data.toJson());

class MyBlogsModel {
    bool? success;
    String? message;
    List<Datum>? data;
    int? statusCode;

    MyBlogsModel({
        this.success,
        this.message,
        this.data,
        this.statusCode,
    });

    factory MyBlogsModel.fromJson(Map<String, dynamic> json) => MyBlogsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "statusCode": statusCode,
    };
}

class Datum {
    String? id;
    String? title;
    String? description;
    String? image;

    Datum({
        this.id,
        this.title,
        this.description,
        this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
    };
}
