import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../infrastructure/repository.dart';
import 'my_blogs_model.dart';

class MyBlogsViewModle {
  MyBlogsViewModle({required this.repository});
  final Repository repository;

  VelocityBloc<MyBlogsModel> getMyBlogsBloc =
      VelocityBloc<MyBlogsModel>(MyBlogsModel());

  fetchMyBlogs() async {
    var getAllBlogsData = await repository.myBlogsRepo.getMyBlogs();
    if (getAllBlogsData.statusCode == 1) {
      getMyBlogsBloc.onUpdateData(getAllBlogsData);
    }
  }
}
