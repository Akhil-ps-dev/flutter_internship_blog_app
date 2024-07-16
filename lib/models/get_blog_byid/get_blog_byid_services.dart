import 'package:velocity_bloc/velocity_bloc.dart';

import '../../infrastructure/repository.dart';
import 'get_blog_byid_model.dart';

class GetBlogsByIdViewModel {
  final Repository repository;
  GetBlogsByIdViewModel({required this.repository});
  VelocityBloc<GetBlogByIdModel> getAllBlogsBloc =
      VelocityBloc<GetBlogByIdModel>(GetBlogByIdModel());

  fetchAllBloggsById() async {
    var getBlogsByIdData = await repository.getBlogsByIdRepo.getBlogsbyId();

    if (getBlogsByIdData.statusCode == 1) {
      getAllBlogsBloc.onUpdateData(getBlogsByIdData);
    }
  }
}
