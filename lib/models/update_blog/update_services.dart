import 'package:flutter/material.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../infrastructure/repository.dart';

class UpdateBlogViewModel {
  final Repository repository;

  UpdateBlogViewModel({required this.repository});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  updateBlog(String blogid, String filePath, context) async {
    isLoadingBloc.onUpdateData(true);
    try {
      var updateblogData = await repository.updateBlogRepo.updateBlog(
        blogid,
        titleController.text,
        descriptionController.text,
        filePath,
        context,
      );
      Vx.log(updateblogData.message.toString());

      if (updateblogData.statusCode == 1) {
        VxToast.show(context, msg: updateblogData.message.toString());
      } else {
        return const SnackBar(
          content: Text("Image Not Uploaded"),
        );
      }
    } catch (e) {
      Vx.log(e.toString());
    } finally {
      isLoadingBloc.onUpdateData(false);
    }
  }
}
