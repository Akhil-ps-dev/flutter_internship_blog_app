import 'package:flutter/material.dart';
import 'package:flutter_internship_blog_app/infrastructure/repository.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/utils/utils.dart';

class RegisterViewModel {
  RegisterViewModel({required this.repository});
  final Repository repository;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController profilePicture = TextEditingController();
  String? gender;

  void setGender(String? newValue) {
    gender = newValue;
  }

  final formKey = GlobalKey<FormState>();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  login(context) async {
    isLoadingBloc.onUpdateData(true);
    var registerData = await repository.registerRepo.userRegister(
        nameController.text,
        emailController.text,
        gender!,
        profilePicture.text,
        passwordController.text,
        context);

    await Utils.saveId(registerData.data!.id.toString());

    if (registerData.data!.token != null) {
      VxToast.show(context, msg: 'Registration Successful');
    }
    isLoadingBloc.onUpdateData(false);
  }
}
