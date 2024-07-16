import 'dart:convert';

import 'package:flutter_internship_blog_app/core/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/remote/api_client.dart';
import '../../core/remote/api_endpoints.dart';
import '../../models/delete_blogs/delete_blogs_model.dart';

class DeleteBlogRepo extends ApiClient {
  DeleteBlogRepo();
// POST
  Future<DeleteBlogsModel> deleteBlog(String blogid, context) async {
    try {
      String token = await Utils().getToken();
      String id = await Utils().getUserId();

      final response = await deleteRequest(
        path: "${ApiEndPointUrls.deleteMyBlog}/$id/$blogid",
        token: token,
      );

      if (response.statusCode == 200) {
        final responseData =
            deleteBlogsModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        DeleteBlogsModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      DeleteBlogsModel();
    }
    return DeleteBlogsModel();
  }
}
