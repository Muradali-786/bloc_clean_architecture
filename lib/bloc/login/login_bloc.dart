import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture/respository/auth/login_repository.dart';
import 'package:bloc_clean_architecture/services/session/session_manager.dart';
import 'package:bloc_clean_architecture/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginRepository loginRepository ;
  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>(_emailChange);
    on<PasswordChanged>(_passChange);
    on<LoginApi>(_loginApi);
  }

  void _emailChange(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passChange(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    Map data = {"email": state.email, "password": state.password};

    await loginRepository.loginRepository(data).then((value)async {


      if (value.error.isNotEmpty) {
        emit(state.copyWith(message: 'error', apiStatus: ApiStatus.error));
      } else {
        await SessionManager().saveUserInPreference(value);
        await SessionManager().getUserFromPreference();


        emit(state.copyWith(
            message: 'Login successful', apiStatus: ApiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: error.toString(), apiStatus: ApiStatus.error));
    });
  }
}
