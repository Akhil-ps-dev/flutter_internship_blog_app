import 'dart:convert';

import 'package:flutter_internship_blog_app/models/register/register_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/remote/api_client.dart';
import '../../core/remote/api_endpoints.dart';

class RegisterRepo extends ApiClient {
  RegisterRepo();
// POST
  Future<RegisterModel> userRegister(String name, String email, String gender,
      String profilePicture, String password, context) async {
    Map body = {
      "name": name,
      "email": email,
      "gender" : gender.toLowerCase(),
      "profilePicture" :profilePicture,
      "password" : password,
    };

    try {
      final response =
          await postRequest(path: ApiEndPointUrls.register, body: body);

      if (response.statusCode == 200) {
        final responseData = registerModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        RegisterModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      RegisterModel();
    }
    return RegisterModel();
  }
}
