// To parse this JSON data, do
//
//     final deleteBlogsModel = deleteBlogsModelFromJson(jsonString);

import 'dart:convert';

DeleteBlogsModel deleteBlogsModelFromJson(String str) => DeleteBlogsModel.fromJson(json.decode(str));

String deleteBlogsModelToJson(DeleteBlogsModel data) => json.encode(data.toJson());

class DeleteBlogsModel {
    String? message;
    bool? success;
    int? statusCode;

    DeleteBlogsModel({
        this.message,
        this.success,
        this.statusCode,
    });

    factory DeleteBlogsModel.fromJson(Map<String, dynamic> json) => DeleteBlogsModel(
        message: json["message"],
        success: json["success"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "statusCode": statusCode,
    };
}
