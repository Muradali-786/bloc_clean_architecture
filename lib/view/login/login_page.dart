import 'package:bloc_clean_architecture/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBlocs;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBlocs = LoginBloc(loginRepository: getItt);
  }

  @override
  void dispose() {
    _loginBlocs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => _loginBlocs,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                EmailInput(
                    focusNode: _emailFocusNode), // Widget for email input field
                PasswordInput(
                    focusNode:
                        _passwordFocusNode), // Widget for password input field
                SubmitButton(
                  formKey: _formKey,
                ), // Widget for submit button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
