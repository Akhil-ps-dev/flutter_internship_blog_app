// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String? message;
    bool? success;
    int? statusCode;
    Data? data;

    LoginModel({
        this.message,
        this.success,
        this.statusCode,
        this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
