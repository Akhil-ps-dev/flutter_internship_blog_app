// To parse this JSON data, do
//
//     final createBlogModel = createBlogModelFromJson(jsonString);

import 'dart:convert';

CreateBlogModel createBlogModelFromJson(String str) => CreateBlogModel.fromJson(json.decode(str));

String createBlogModelToJson(CreateBlogModel data) => json.encode(data.toJson());

class CreateBlogModel {
    bool? success;
    String? message;
    int? statusCode;

    CreateBlogModel({
        this.success,
        this.message,
        this.statusCode,
    });

    factory CreateBlogModel.fromJson(Map<String, dynamic> json) => CreateBlogModel(
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
