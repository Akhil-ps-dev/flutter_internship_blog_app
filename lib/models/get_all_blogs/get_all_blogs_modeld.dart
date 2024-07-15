// To parse this JSON data, do
//
//     final getAllBlogsModel = getAllBlogsModelFromJson(jsonString);

import 'dart:convert';

GetAllBlogsModel getAllBlogsModelFromJson(String str) => GetAllBlogsModel.fromJson(json.decode(str));

String getAllBlogsModelToJson(GetAllBlogsModel data) => json.encode(data.toJson());

class GetAllBlogsModel {
    bool? success;
    String? message;
    List<Datum>? data;
    int? statusCode;

    GetAllBlogsModel({
        this.success,
        this.message,
        this.data,
        this.statusCode,
    });

    factory GetAllBlogsModel.fromJson(Map<String, dynamic> json) => GetAllBlogsModel(
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
    User? user;

    Datum({
        this.id,
        this.title,
        this.description,
        this.image,
        this.user,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "user": user?.toJson(),
    };
}

class User {
    String? id;
    String? name;
    String? profilePicture;

    User({
        this.id,
        this.name,
        this.profilePicture,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        profilePicture: json["profilePicture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profilePicture": profilePicture,
    };
}
