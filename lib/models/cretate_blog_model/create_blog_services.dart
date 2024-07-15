import 'package:flutter/material.dart';
import 'package:flutter_internship_blog_app/infrastructure/repository.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

class CreateBlogViewModel {
  CreateBlogViewModel({required this.repository});
  final Repository repository;
  TextEditingController titleContoller = TextEditingController();
  TextEditingController descriptionContoller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  createBlog(String filePath, context) async {
    var createBlogdata = await repository.createBlogRepo.createBlog(
        titleContoller.text, descriptionContoller.text, filePath, context);

    if (createBlogdata.statusCode == 1) {
      return SnackBar(content: Text(createBlogdata.message!));
    } else {
      return SnackBar(content: Text(createBlogdata.message!));
    }
  }
}
