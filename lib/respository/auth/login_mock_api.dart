import 'package:bloc_clean_architecture/model/user/user_model.dart';
import 'package:bloc_clean_architecture/respository/auth/login_repository.dart';

class LoginMockRepository implements LoginRepository {
  @override
  Future<UserModel> loginRepository(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = {'token': 'jsdhfksjdhf123'};

    return UserModel.fromJson(response);
  }
}
