import 'package:bloc_clean_architecture/model/user/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> loginRepository(dynamic data);
}
