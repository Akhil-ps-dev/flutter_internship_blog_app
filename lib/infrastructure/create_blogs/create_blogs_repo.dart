import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_internship_blog_app/core/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/remote/api_client.dart';
import '../../core/remote/api_endpoints.dart';
import '../../models/cretate_blog_model/create_blog_model.dart';

class CreateBlogsRepo extends ApiClient {
  CreateBlogsRepo();
// POST
  Future<CreateBlogModel> createBlog(
      String title, String description, String filePath, context) async {
    String fileName = filePath.split('/').last;
    FormData body = FormData.fromMap({
      "title": title,
      "description": description,
      "image": await MultipartFile.fromFile(filePath, filename: fileName)
    });

    try {
      String token = await Utils().getToken();
      String id = await Utils().getUserId();

      final response = await postRequest(
          path: "${ApiEndPointUrls.createBlog}/$id", body: body, token: token);

      if (response.statusCode == 200) {
        final responseData = createBlogModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        CreateBlogModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      CreateBlogModel();
    }
    return CreateBlogModel();
  }
}
