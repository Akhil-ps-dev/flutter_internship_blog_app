import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../infrastructure/repository.dart';
import 'get_all_blogs_modeld.dart';

class GetAllBlogsViewModle {
  GetAllBlogsViewModle({required this.repository});
  final Repository repository;

  VelocityBloc<GetAllBlogsModel> getAllBlogsBloc =
      VelocityBloc<GetAllBlogsModel>(GetAllBlogsModel());

  fetchAllBlogs() async {
    var getAllBlogsData = await repository.getAllBlogsRepo.getAllBlogs();
    if (getAllBlogsData.statusCode == 1) {
      getAllBlogsBloc.onUpdateData(getAllBlogsData);
    }
  }
}
