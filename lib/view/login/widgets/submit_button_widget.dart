import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;

  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current, previou) => false,
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              if (formKey.currentState.validate()) {
                print('all is well');
              }
            },
            child: const Text('Login'));
      },
    );
  }
}
