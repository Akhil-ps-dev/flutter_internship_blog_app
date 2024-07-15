import 'dart:convert';

import 'package:flutter_internship_blog_app/core/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/remote/api_client.dart';
import '../../core/remote/api_endpoints.dart';
import '../../models/get_all_blogs/get_all_blogs_modeld.dart';

class GetAllBlogsRepo extends ApiClient {
  GetAllBlogsRepo();
// POST
  Future<GetAllBlogsModel> getAllBlogs() async {
    try {
      String token = await Utils().getToken();

      final response =
          await getRequest(path: ApiEndPointUrls.getAllBlogs, token: token);

      if (response.statusCode == 200) {
        final responseData =
            getAllBlogsModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        GetAllBlogsModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      GetAllBlogsModel();
    }
    return GetAllBlogsModel();
  }
}
