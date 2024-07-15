import 'auth/login_rego.dart';
import 'auth/register_repo.dart';

class Repository {
  Repository( {required this.loginRepo,required this.registerRepo,});
  final LoginRepo loginRepo;
  final RegisterRepo registerRepo;
}
