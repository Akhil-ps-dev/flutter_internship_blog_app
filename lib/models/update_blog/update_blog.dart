// To parse this JSON data, do
//
//     final updateBlogModel = updateBlogModelFromJson(jsonString);

import 'dart:convert';

UpdateBlogModel updateBlogModelFromJson(String str) => UpdateBlogModel.fromJson(json.decode(str));

String updateBlogModelToJson(UpdateBlogModel data) => json.encode(data.toJson());

class UpdateBlogModel {
    bool? success;
    String? message;
    int? statusCode;

    UpdateBlogModel({
        this.success,
        this.message,
        this.statusCode,
    });

    factory UpdateBlogModel.fromJson(Map<String, dynamic> json) => UpdateBlogModel(
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
