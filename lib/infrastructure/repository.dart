import 'auth/login_rego.dart';
import 'auth/register_repo.dart';
import 'get_all_blogs/get_all_blogs_repo.dart';

class Repository {
  Repository({
    required this.loginRepo,
    required this.registerRepo,
    required this.getAllBlogsRepo,
  });
  final LoginRepo loginRepo;
  final RegisterRepo registerRepo;
  final GetAllBlogsRepo getAllBlogsRepo;
}
