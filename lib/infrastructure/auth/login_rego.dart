import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import '../../../core/remote/api_client.dart';
import '../../core/remote/api_endpoints.dart';
import '../../models/login/login_model.dart';

class LoginRepo extends ApiClient {
  LoginRepo();
// POST
  Future<LoginModel> userLogin(String email, String password, context) async {
    Map body = {
      "email": email,
      "password": password,
    };

    try {
      final response =
          await postRequest(path: ApiEndPointUrls.login, body: body);

      if (response.statusCode == 200) {
        final responseData = loginModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        LoginModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      LoginModel();
    }
    return LoginModel();
  }
}
