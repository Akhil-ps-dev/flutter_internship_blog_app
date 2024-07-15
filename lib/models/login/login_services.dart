import 'package:flutter/material.dart';
import 'package:flutter_internship_blog_app/infrastructure/repository.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/utils/utils.dart';
import '../../screens/bottom_nav/bottom_navbar.dart';

class LoginViewModel {
  LoginViewModel({required this.repository});
  final Repository repository;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  login(context) async {
    isLoadingBloc.onUpdateData(true);
    var logindata = await repository.loginRepo
        .userLogin(emailController.text, passwordController.text, context);

    await Utils.saveId(logindata.data!.id.toString());

    if (logindata.data!.token != null) {
      await Utils.saveToken(logindata.data!.token.toString());
      Vx.log('token: ${logindata.data!.token}');
      Vx.log('id: ${logindata.data!.id}');

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return BottomNavBar();
      }));
    }
    isLoadingBloc.onUpdateData(false);
  }
}
