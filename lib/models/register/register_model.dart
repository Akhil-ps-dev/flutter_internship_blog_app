// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    String? message;
    bool? success;
    int? statusCode;
    Data? data;

    RegisterModel({
        this.message,
        this.success,
        this.statusCode,
        this.data,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "statusCode": statusCode,
        "data": data?.toJson(),
    };
}

class Data {
    String? id;
    String? name;
    String? email;
    String? token;

    Data({
        this.id,
        this.name,
        this.email,
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "token": token,
    };
}
