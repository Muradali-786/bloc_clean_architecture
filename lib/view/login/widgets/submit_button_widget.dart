import 'package:bloc_clean_architecture/utils/enums.dart';
import 'package:bloc_clean_architecture/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';
import '../../../config/routes/route_name.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;

  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (current, previous) =>
          current.apiStatus != previous.apiStatus,
      listener: (context, state) {
        switch (state.apiStatus) {
          case ApiStatus.error:
            Utils().flushBarErrorMessage(context, 'ERROR');
          case ApiStatus.loading:
            Utils().flushBarErrorMessage(context, 'Loading');
          case ApiStatus.success:
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.homePage, (route) => false);
            Utils().flushBarErrorMessage(context, 'Success');

          default:
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (current, previous) =>
            current.apiStatus != previous.apiStatus,
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  context.read<LoginBloc>().add(LoginApi());
                }
              },
              child: state.apiStatus == ApiStatus.loading
                  ? const CircularProgressIndicator()
                  : const Text('Login'));
        },
      ),
    );
  }
}
