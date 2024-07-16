//*========================GET User Profile===============================\\
import 'package:velocity_x/velocity_x.dart';

import '../../core/remote/api_client.dart';
import '../../core/remote/api_endpoints.dart';
import '../../core/utils/utils.dart';
import '../../models/get_blog_byid/get_blog_byid_model.dart';

class GetBlogsByIdRepo extends ApiClient {
  GetBlogsByIdRepo();

//========================GET User Profile===============================\\

  Future<GetBlogByIdModel> getBlogsbyId() async {
    try {
      String token = await Utils().getToken();
      final response = await getRequest(
        path: ApiEndPointUrls.getBlogbyId,
        token: token,
      );
      if (response.statusCode == 200) {
        //* 1st Solution
        // final responseData = genderModelFromJson(jsonEncode(response.data));
        // return responseData;

        //* 2nd Solution(call directly from model "From json")
        final responseData = GetBlogByIdModel.fromJson(response.data);
        return responseData;
      } else {
        GetBlogByIdModel;
      }
    } on Exception catch (e) {
      Vx.log(e);
      GetBlogByIdModel;
    }
    return GetBlogByIdModel();
  }
}
