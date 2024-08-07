import 'package:bloc_clean_architecture/config/app_url.dart';
import 'package:bloc_clean_architecture/data/network/network_api_services.dart';
import 'package:bloc_clean_architecture/model/user/user_model.dart';
import 'package:bloc_clean_architecture/respository/auth/login_repository.dart';

class LoginHttpRepository implements LoginRepository {
  final _api = NetworkApiServices();

  @override
  Future<UserModel> loginRepository(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginUrl, data);

    return UserModel.fromJson(response);
  }


}
