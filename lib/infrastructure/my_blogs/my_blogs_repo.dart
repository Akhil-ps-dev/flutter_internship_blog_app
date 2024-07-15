import 'dart:convert';

import 'package:flutter_internship_blog_app/core/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/remote/api_client.dart';
import '../../core/remote/api_endpoints.dart';
import '../../models/my_blogs/my_blogs_model.dart';

class MyBlogsRepo extends ApiClient {
  MyBlogsRepo();
// POST
  Future<MyBlogsModel> getMyBlogs() async {
    try {
      String token = await Utils().getToken();
         String id = await Utils().getUserId();


      final response =
          await getRequest(path: "${ApiEndPointUrls.myBlogs}/$id", token: token);

      if (response.statusCode == 200) {
        final responseData =
            myBlogsModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        MyBlogsModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      MyBlogsModel();
    }
    return MyBlogsModel();
  }
}
