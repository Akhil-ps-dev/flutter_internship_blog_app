import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/remote/api_client.dart';
import '../../core/remote/api_endpoints.dart';
import '../../core/utils/utils.dart';
import '../../models/update_blog/update_blog.dart';

class UpdateBlogRepo extends ApiClient {
  UpdateBlogRepo();
// POST
  Future<UpdateBlogModel> updateBlog(String blogid, String title,
      String description, String filePath, context) async {
    String filename = filePath.split('/').last;

    FormData body = FormData.fromMap({
      "title": title,
      "description": description,
      "image": await MultipartFile.fromFile(filePath, filename: filename),
    });
    try {
      String token = await Utils().getToken();

      //get user's id AND PUT IT IN THE URL
      String id = await Utils().getUserId();

      final response = await updateRequest(
          path: "${ApiEndPointUrls.updateBlog}/$id/$blogid",
          body: body,
          token: token);

      if (response.statusCode == 200) {
        final responseData = updateBlogModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        UpdateBlogModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      UpdateBlogModel();
    }

    return UpdateBlogModel();
  }
}
