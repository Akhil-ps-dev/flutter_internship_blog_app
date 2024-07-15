import 'auth/login_rego.dart';
import 'auth/register_repo.dart';
import 'create_blogs/create_blogs_repo.dart';
import 'get_all_blogs/get_all_blogs_repo.dart';
import 'my_blogs/my_blogs_repo.dart';

class Repository {
  Repository({
    required this.loginRepo,
    required this.registerRepo,
    required this.getAllBlogsRepo,
    required this.createBlogRepo,
    required this.myBlogsRepo,
  });
  final LoginRepo loginRepo;
  final RegisterRepo registerRepo;
  final GetAllBlogsRepo getAllBlogsRepo;
  final CreateBlogsRepo createBlogRepo;
  final MyBlogsRepo myBlogsRepo;
}
