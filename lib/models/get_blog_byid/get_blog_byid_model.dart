// To parse this JSON data, do
//
//     final getBlogByIdModel = getBlogByIdModelFromJson(jsonString);

import 'dart:convert';

GetBlogByIdModel getBlogByIdModelFromJson(String str) => GetBlogByIdModel.fromJson(json.decode(str));

String getBlogByIdModelToJson(GetBlogByIdModel data) => json.encode(data.toJson());

class GetBlogByIdModel {
    bool? success;
    String? message;
    int? statusCode;

    GetBlogByIdModel({
        this.success,
        this.message,
        this.statusCode,
    });

    factory GetBlogByIdModel.fromJson(Map<String, dynamic> json) => GetBlogByIdModel(
        success: json["success"],
        message: json["message"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "statusCode": statusCode,
    };
}
