import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../infrastructure/repository.dart';
import 'delete_blogs_model.dart';

class DeleteBlogViewModle {
  DeleteBlogViewModle({required this.repository});
  final Repository repository;

  VelocityBloc<DeleteBlogsModel> deletesBloc =
      VelocityBloc<DeleteBlogsModel>(DeleteBlogsModel());

  deleteBlog(String blogid, context) async {
    var getAllBlogsData =
        await repository.deleteBlogRepo.deleteBlog(blogid, context);
    if (getAllBlogsData.statusCode == 1) {
      deletesBloc.onUpdateData(getAllBlogsData);
    }
  }
}
